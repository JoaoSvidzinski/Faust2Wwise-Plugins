# Faust2Wwise-Plugins
Faust-based audio plugins for Wwise integration

## Guidelines for manual integration
This documentation provides a step-by-step guide to integrate Faust-based audio plugins into Audiokinetic Wwise. The ultimate goal is to create an integration script.

---

## 1. Generate and Build the Wwise Plugin Project

### 1.1. Project Setup

1.  Create the Wwise plugin folder.
2.  Generate a new plugin using `wp.py`:
    ```bash
    py {wp} new new --effect -a YourAuthorName -n Lowpass -t "First Order Lowpass" -d "Simple First Order Lowpass Filter"
    ```
3.  Generate project files for authoring:
    ```bash
    py {wp.py} premake Authoring
    ```

### 1.2. Wwise SDK Configuration

1.  Open the solution file (e.g., `JSgranulator_Authoring_Windows_vc160.sln`) in the Wwise SDK.
2.  In the general properties, update the Windows SDK version to your installed version (e.g., `10.0.26100.0`).
3.  Change the plugin ID to a unique value in `<test.xml>` and `<test.cpp>` (search for `in_plugin Id`).
4.  Update `<testConfig.h>` with the new plugin ID.

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

1.  Rename your Faust-generated header file to `<plugin_faust.h>`.
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

Immediately after, in `<PluginFx.h>`, declare:

```cpp
    FaustGainFXParams* m_pParams;
    AK::IAkPluginMemAlloc* m_pAllocator;
    AK::IAkEffectPluginContext* m_pContext;
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
