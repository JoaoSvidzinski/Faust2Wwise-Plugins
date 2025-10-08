# Faust2Wwise-Plugins
Faust-based audio plugins for Wwise integration

## Guidelines for manual integration
This documentation provides a step-by-step guide to integrate Faust-based audio plugins into Audiokinetic Wwise. The ultimate goal is to create an integration script.

In this documentation, the **JSgranulation** code is used as an example.
It integrates the [`granulator.dsp`](https://faustdoc.grame.fr/examples/bela/#granulator) code *“Adapted from sfIter by Christophe Lebreton”* from the Faust Demo.

The plugin has **one input** and outputs a **mono signal duplicated** on both **left and right** channels.

#### Tested Environments

**Windows**
* Unity 2022.3.36f1
* Wwise 2024.1.8.8893.3634

**Mac**
* Unity 2022.3.62f1
* Wwise 2024.1.4.8780

- [1. Generate and Build the Wwise Plugin Project](#1-generate-and-build-the-wwise-plugin-project)
  - [1.1. Project Setup](#11-project-setup)
  - [1.2. Wwise SDK Configuration](#12-wwise-sdk-configuration)
  - [1.3. Build the Plugin](#13-build-the-plugin)
- [2. Generate C++ from Faust (.dsp)](#2-generate-c-from-faust-dsp)
- [3. Compile the Project with Faust-Generated C++](#3-compile-the-project-with-faust-generated-c)
  - [3.1. Add Headers](#31-add-headers)
  - [3.2. File Integration](#32-file-integration)
- [4. Integrate Faust Code into the Plugin](#4-integrate-faust-code-into-the-plugin)
  - [4.1. Declare Members](#41-declare-members)
  - [4.2. Initialization](#42-initialization)
- [5. Add Parameters](#5-add-parameters)
  - [5.1. Define IDs and RTPC Structure](#51-define-ids-and-rtpc-structure)
  - [5.2. Initialize in Constructor](#52-initialize-in-constructor)
  - [5.3. Adapt Parameter Reading (Authoring)](#53-adapt-parameter-reading-authoring)
  - [5.4. Write Parameters to SoundBank](#54-write-parameters-to-soundbank)
  - [5.5. Expose Properties in Plugin.xml](#55-expose-properties-in-pluginxml)
- [6. Modify the Execute Function](#6-modify-the-execute-function)
  - [6.1. Connect RTPCs to Faust Sliders](#61-connect-rtpcs-to-faust-sliders)

- [Unity Deployment Guide](#Unity-Deployment-Guide)
---

## 1. Generate and Build the Wwise Plugin Project

### 1.1. Project Setup

1.  Create the Wwise plugin folder.
2.  Generate a new plugin using `wp.py`:
    ```bash
    py {wp} new new --effect -a YourAuthorName -n Jsgranulator -t "Granular faust integration" -d "Granulator from Faust IDE demo  "
    ```
3.  Generate project files for authoring:
    ```bash
    py {wp.py} premake Authoring
    ```

### 1.2. Wwise SDK Configuration

1.  Open the solution file (e.g., `JSgranulator_Authoring_Windows_vc160.sln`) in the Wwise SDK.
2.  In the general properties, update the Windows SDK version to your installed version (e.g., `10.0.26100.0`).


### 1.3. Build the Plugin

Build the authoring component:
```bash
py {wp.py} build Authoring -c Release -x x64_vc160
```

---

## 2. Generate C++ from Faust (.dsp)

Generate the C++ source file from your Faust `.dsp` file:
```bash
faust -lang cpp -ct 1 -es 1 -mcd 16 -mdd 1024 -mdy 33 -single -ftz 0 <your_faust_file.dsp> -o <output_file.cpp>
```

---

## 3. Compile the Project with Faust-Generated C++

### 3.1. Add Headers

After `#define FAUSTCALSS mydsp`, add the following includes in your C++ file:

```cpp
#include <iostream>
#include "faust/dsp/dsp.h"
#include "faust/gui/PrintUI.h"
#include "faust/gui/MapUI.h"
#include "faust/gui/LayoutUI.h" // If LAYOUT_UI is defined
#include "faust/gui/meta.h"
#include "faust/dsp/fixed-point.h" // If FIXED_POINT is defined
```

### 3.2. File Integration

1.  Rename your Faust-generated `.cpp` file to `<plugin_faust.h>`.
2.  Add `<plugin_faust.h>` to the `<SoundEnginePlugin>` folder in your project and include it in the VC tree (Add > Existing Item...).
3.  Copy the Faust include folder (e.g., `C:\Faust\include`) into your `<plugin_folder>\SoundEnginePlugin` directory.
4.  Include `<plugin_faust.h>` at the top of your main plugin file, `<PluginFx.h>`:
    ```cpp
    #include "pluginfaust.h"
    ```
5.  Add the Faust include directory to your MSVC project settings:
    `C/C++ → General → Additional Include Directories` (e.g., `$(FAUST_INC)` or `C:\Faust\include`).

---

## 4. Integrate Faust Code into the Plugin

### 4.1. Declare Members

In your plugin's DSP and UI class (e.g., in `<PluginFx.h>`), add the following private members:

```cpp
private:
    mydsp mDSP;
    MapUI mUI;
```

### 4.2. Initialization

In your `<pluginFX.cpp>` file, within the `YourEffect::Init(...)` function, initialize the Faust DSP and UI:

```cpp
bool YourEffect::Init(...)
{
    mDSP.init((int)in_rFormat.uSampleRate);
    mDSP.buildUserInterface(&mUI);
    return true;
}
```

---

## 5. Add Parameters

This section describes integrating Faust parameters with Wwise RTPCs.

### 5.1. Define IDs and RTPC Structure

In `<FaustGainFXParams.h>`, define unique IDs for your parameters and the RTPC structure:

```cpp
// Unique Identifiers for parameters
static const AkPluginParamID PARAM_GRAINSIZE_ID    = 0;
static const AkPluginParamID PARAM_SPEED_ID        = 1;
static const AkPluginParamID PARAM_PROBABILITY_ID  = 2;
static const AkUInt32 NUM_PARAMS = 3;

// RTPC stored by the runtime
struct JSgranulatorRTPCParams
{
    AkReal32 fGrainSize;
    AkReal32 fSpeed;
    AkReal32 fProbability;
};
```

### 5.2. Initialize in Constructor

In the constructor function `Init` within `<JSgranulatorFXParams.cpp>`, initialize default values for the RTPC parameters:

```cpp
AKRESULT JSgranulatorFXParams::Init(AK::IAkPluginMemAlloc* in_pAllocator, const void* in_pParamsBlock, AkUInt32 in_ulBlockSize)
{
    if (in_ulBlockSize == 0)
    {
        // Default values initialization
        RTPC.fGrainSize = 200.0f;
        RTPC.fSpeed     = 10.0f;
        RTPC.fProbability = 70.0f;
        m_paramChangeHandler.SetAllParamChanges();
    }
    else
    {
        // Read from bank
        SetParamsBlock(in_pParamsBlock, in_ulBlockSize);
    }
    return AK_Success;
}
```

### 5.3. Adapt Parameter Reading (Authoring)

In `<FaustGainFXParams.cpp>`, modify `SetParamsBlock` and `SetParam` functions to correctly read parameters sent by the authoring tool.

#### SetParamsBlock Example:

```cpp
AKRESULT JSgranulatorFXParams::SetParamsBlock(const void* in_pParamsBlock, AkUInt32 in_ulBlockSize)
{
    AKRESULT eResult = AK_Success;
    AkUInt8* pParamsBlock = (AkUInt8*)in_pParamsBlock;

    // Read the 3 floats from the Bank
    RTPC.fGrainSize = READBANKDATA(AkReal32, pParamsBlock, in_ulBlockSize);
    RTPC.fSpeed = READBANKDATA(AkReal32, pParamsBlock, in_ulBlockSize);
    RTPC.fProbability = READBANKDATA(AkReal32, pParamsBlock, in_ulBlockSize);

    // CHECKBANKDATASIZE(in_ulBlockSize, eResult); // Example of bank data size check

    // Signal that all parameters have changed
    m_paramChangeHandler.SetAllParamChanges();

    return eResult;
}
```

#### SetParam Example (within `switch` statement):

```cpp
switch (in_paramID)
{
    case PARAM_GRAINSIZE_ID:
        RTPC.fGrainSize = *((AkReal32*)in_pValue);
        m_paramChangeHandler.SetParamChange(PARAM_GRAINSIZE_ID);
        break;
    case PARAM_SPEED_ID:
        RTPC.fSpeed = *((AkReal32*)in_pValue);
        m_paramChangeHandler.SetParamChange(PARAM_SPEED_ID);
        break;
    case PARAM_PROBABILITY_ID:
        RTPC.fProbability = *((AkReal32*)in_pValue);
        m_paramChangeHandler.SetParamChange(PARAM_PROBABILITY_ID);
        break;
    default:
        eResult = AK_InvalidParameter;
        break;
}
return eResult;
```

### 5.4. Write Parameters to SoundBank

In `<JSgranulatorPlugin.cpp>` (Authoring), modify `GetBankParameters` to write all three floats to the SoundBank:

```cpp
bool JSgranulatorPlugin::GetBankParameters(const GUID& in_guidPlatform, AK::Wwise::IWriteData* in_pDataWriter) const
{
    CComVariant varProp;

    m_pPSet->GetValue(in_guidPlatform, L"GrainSize", varProp);
    in_pDataWriter->WriteReal32(varProp.fltVal);

    m_pPSet->GetValue(in_guidPlatform, L"Speed", varProp);
    in_pDataWriter->WriteReal32(varProp.fltVal);

    m_pPSet->GetValue(in_guidPlatform, L"Probability", varProp);
    in_pDataWriter->WriteReal32(varProp.fltVal);

    return true;
}
```

### 5.5. Expose Properties in Plugin.xml

To display properties in the Wwise UI, define them in `<Plugin.xml>`:

```xml
<Property Name="Probability" Type="Real32" SupportRTPCType="Exclusive" DisplayName="Probability">
    <UserInterface Step="1.0" Fine="0.1" Decimals="1" UIMax="100.0" />
    <DefaultValue>70.0</DefaultValue>
    <AudioEnginePropertyID>2</AudioEnginePropertyID>
    <Restrictions>
        <ValueRestriction>
            <Range Type="Real32">
                <Min>0.0</Min>
                <Max>100.0</Max>
            </Range>
        </ValueRestriction>
    </Restrictions>
</Property>
```

---

## 6. Modify the Execute Function

In your plugin's `Execute` function (e.g., `JSpitchShifterFX::Execute` in `<JSpitchShifterFX.cpp>`), make the following changes:

```cpp
void JSpitchShifterFX::Execute(AkAudioBuffer* in_pBuffer, AkUInt32 in_ulOffset, AkAudioBuffer* out_pBuffer)
{
    const AkUInt32 uNumChannels = in_pBuffer->NumChannels();
    const AkUInt32 uNumFrames = in_pBuffer->uValidFrames;

    if (uNumFrames == 0)
        return;

    // Prepare input/output pointers
    std::vector<FAUSTFLOAT*> inputs(mDSP.getNumInputs());
    std::vector<FAUSTFLOAT*> outputs(mDSP.getNumOutputs());

    // Assuming 1 input / 1 output
    inputs[0] = reinterpret_cast<FAUSTFLOAT*>(in_pBuffer->GetChannel(0) + in_ulOffset);
    outputs[0] = reinterpret_cast<FAUSTFLOAT*>(out_pBuffer->GetChannel(0) + out_pBuffer->uValidFrames);

    // --- Update parameters from RTPC (defined in FXParams.h/.cpp) ---
    // Example: Replace with your actual Faust parameter names and RTPC values
    mUI.setParamValue("shift (semitones)", m_pParams->RTPC.fShift);
    mUI.setParamValue("window (samples)", m_pParams->RTPC.fWindow);
    mUI.setParamValue("xfade (samples)", m_pParams->RTPC.fXfade);

    // --- DSP Processing ---
    mDSP.compute(uNumFrames, inputs.data(), outputs.data());

    // If multiple channels, copy the signal from the first processed channel
    for (AkUInt32 c = 1; c < uNumChannels; ++c)
    {
        AkReal32* outBuf = (AkReal32*)out_pBuffer->GetChannel(c) + out_pBuffer->uValidFrames;
        FAUSTFLOAT* firstChannel = outputs[0];
        for (AkUInt32 f = 0; f < uNumFrames; ++f)
            outBuf[f] = firstChannel[f];
    }

    // Update counters
    out_pBuffer->uValidFrames += uNumFrames;
    in_pBuffer->uValidFrames = 0; // All consumed

    // Update Wwise state logic
    if (in_pBuffer->eState == AK_NoMoreData && in_pBuffer->uValidFrames == 0)
        out_pBuffer->eState = AK_NoMoreData;
    else if (out_pBuffer->uValidFrames == out_pBuffer->MaxFrames())
        out_pBuffer->eState = AK_DataReady;
    else
        out_pBuffer->eState = AK_DataNeeded;
}
```

### 6.1. Connect RTPCs to Faust Sliders

In the `Execute` function of `<JSgranulatorFX.cpp>`, before calling `compute`, link your RTPCs to the Faust sliders:

```cpp
mUI.setParamValue("faust_parameter_name", rtp_value);
```
---
---
# Unity Deployment Guide

This guide outlines the steps for deploying the JSgranulator plugin to Unity for both Windows and Android runtimes.

## Table of Contents

- [Dependencies](#dependencies)
- [Windows Runtime Deployment](#windows-runtime-deployment)
  - [Generate .dll File](#generate-dll-file)
  - [Move .dll to Unity Project](#move-dll-to-unity-project)
- [Android Runtime Deployment](#android-runtime-deployment)
  - [Install NDK (Android Studio)](#install-ndk-android-studio)
  - [Set NDKROOT Environment Variable](#set-ndkroot-environment-variable)
  - [Set CMake Variable](#set-cmake-variable)
  - [Add Faust Dependencies](#add-faust-dependencies)
  - [Premake Android](#premake-android)
  - [Build Android](#build-android)
  - [Copy .so File to Unity Project](#copy-so-file-to-unity-project)
  - [Remove RtMidi.cpp](#remove-rtmidicpp)

## Dependencies

To deploy JSgranulator, you will need the following:

-   **Python 3:** For running deployment scripts (`wp.py`).
-   **Wwise SDK:** Specifically version `2024.1.8.8893` (or compatible) for access to `JSgranulator.dll` and `libJSgranulator.so`.
-   **Android Studio:** Required for installing the Android NDK and CMake.
-   **Android NDK:** Version `4.1.1` (or compatible) is mentioned in the CMake path.
-   **CMake:** Used for building the Android project.
-   **Unity Project:** The target environment for the deployed plugin.

## Windows Runtime Deployment

### Generate .dll File

1.  Open your preferred terminal or command prompt.
2.  Navigate to the directory containing `wp.py` (presumably within your Wwise project or SDK).
3.  Run the following command to generate the `JSgranulator.dll` file:

    ```bash
    py {wp.py} build Windows_vc160  -c Release
    ```

### Move .dll to Unity Project

1.  Locate the generated `JSgranulator.dll` file. It should be in a path similar to:

    ```
    \Audiokinetic\Wwise2024.1.8.8893\SDK\x64_vc160\Release\bin\JSgranulator.dll
    ```

2.  Copy this `.dll` file to your Unity project's Wwise plugin directory:

    ```
    <YourUnityProjectFolder>\Assets\Wwise\API\Runtime\Plugins\Windows\x86_64\DSP
    ```

## Android Runtime Deployment

### Install NDK (Android Studio)

If you haven't already installed the NDK:

1.  Open Android Studio.
2.  Go to `Tools > SDK Manager > SDK Tools`.
3.  Check the boxes for `NDK (Side by side)` and `CMake`.
4.  Click `Apply` or `OK` to install them.

The default path for the Android SDK will be similar to: `<userPath>\AppData\Local\Android\Sdk`

### Set NDKROOT Environment Variable

1.  Open PowerShell or System Environment Variables.
2.  Set the `NDKROOT` variable to your Android SDK path:

    ```powershell
    setx NDKROOT "<userPath>\AppData\Local\Android\Sdk"
    ```

### Set CMake Variable

1.  Set the `PATH` environment variable to include the CMake binary:

    ```powershell
    setx PATH "$($env:PATH);<userPath>\AppData\Local\Android\Sdk\cmake\4.1.1\bin"
    ```

### Add Faust Dependencies

You need to modify `JSgranulator_Android_static` and `CMakeLists.txt` to include the necessary Faust dependencies and compiler flags.

1.  **Modify `JSgranulator_Android_static`:**
    Add the following lines:

    ```powershell
    target_include_directories("JSgranulatorFX" PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../SoundEnginePlugin")
    target_compile_definitions("JSgranulatorFX" PRIVATE "LLVM_DSP")
    target_compile_options("JSgranulatorFX" PRIVATE "-fexceptions")
    ```

2.  **Modify `CMakeLists.txt`:**
    Add this line:

  ```cmake
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions")
   ```

    Also, ensure to **remove all `-fno-exceptions`** flags from `JSgranulator_Android_static`.

### Remove RtMidi.cpp

Remove `RtMidi.cpp` and any ALSA/MIDI related files, as the plugin does not require them for Android.
For instance, remove the reference :

  ```cmake
  "${CMAKE_CURRENT_LIST_DIR}/faust/midi/RtMidi.cpp"
  ```

### Premake Android

1.  Run the following command to generate the Android build files:

 ```powershell
  py {wp.py} premake Android
 ```

### Build Android

1.  Build the Android project with the following command:

  ```powershell
  py {wp.py} build Android -c Release -x arm64-v8a
  ```

### Copy .so File to Unity Project

1.  Locate the generated `libJSgranulator.so` file. It will be in a path similar to:

  ```powershell
  C:\Audiokinetic\Wwise2024.1.8.8893\SDK\Android_arm64-v8a\Release\bin\libJSgranulator.so
  ```

2.  Copy this `.so` file to your Unity project's Android Wwise plugin directory:

 ```powershell
 {YourFaustProjectFolder}\Assets\Wwise\API\Runtime\Plugins\Android\arm64-v8a\DSP
 ```
