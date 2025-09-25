/*******************************************************************************
The content of this file includes portions of the AUDIOKINETIC Wwise Technology
released in source code form as part of the SDK installer package.

Commercial License Usage

Licensees holding valid commercial licenses to the AUDIOKINETIC Wwise Technology
may use this file in accordance with the end user license agreement provided
with the software or, alternatively, in accordance with the terms contained in a
written agreement between you and Audiokinetic Inc.

Apache License Usage

Alternatively, this file may be used under the Apache License, Version 2.0 (the
"Apache License"); you may not use this file except in compliance with the
Apache License. You may obtain a copy of the Apache License at
http://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software distributed
under the Apache License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
OR CONDITIONS OF ANY KIND, either express or implied. See the Apache License for
the specific language governing permissions and limitations under the License.

  Copyright (c) 2025 Audiokinetic Inc.
*******************************************************************************/

#include "JSgranulatorFX.h"
#include "../JSgranulatorConfig.h"

#include <AK/AkWwiseSDKVersion.h>

AK::IAkPlugin* CreateJSgranulatorFX(AK::IAkPluginMemAlloc* in_pAllocator)
{
    return AK_PLUGIN_NEW(in_pAllocator, JSgranulatorFX());
}

AK::IAkPluginParam* CreateJSgranulatorFXParams(AK::IAkPluginMemAlloc* in_pAllocator)
{
    return AK_PLUGIN_NEW(in_pAllocator, JSgranulatorFXParams());
}

AK_IMPLEMENT_PLUGIN_FACTORY(JSgranulatorFX, AkPluginTypeEffect, JSgranulatorConfig::CompanyID, JSgranulatorConfig::PluginID)

JSgranulatorFX::JSgranulatorFX()
    : m_pParams(nullptr)
    , m_pAllocator(nullptr)
    , m_pContext(nullptr)
{
}

JSgranulatorFX::~JSgranulatorFX()
{
}

AKRESULT JSgranulatorFX::Init(AK::IAkPluginMemAlloc* in_pAllocator, AK::IAkEffectPluginContext* in_pContext, AK::IAkPluginParam* in_pParams, AkAudioFormat& in_rFormat)
{
    m_pParams = (JSgranulatorFXParams*)in_pParams;
    m_pAllocator = in_pAllocator;
    m_pContext = in_pContext;

    mDSP.init((int)in_rFormat.uSampleRate);
    mDSP.buildUserInterface(&mUI);

    return AK_Success;
}

AKRESULT JSgranulatorFX::Term(AK::IAkPluginMemAlloc* in_pAllocator)
{
    AK_PLUGIN_DELETE(in_pAllocator, this);
    return AK_Success;
}

AKRESULT JSgranulatorFX::Reset()
{
    return AK_Success;
}

AKRESULT JSgranulatorFX::GetPluginInfo(AkPluginInfo& out_rPluginInfo)
{
    out_rPluginInfo.eType = AkPluginTypeEffect;
    out_rPluginInfo.bIsInPlace = false;
	out_rPluginInfo.bCanProcessObjects = false;
    out_rPluginInfo.uBuildVersion = AK_WWISESDK_VERSION_COMBINED;
    return AK_Success;
}

void JSgranulatorFX::Execute(AkAudioBuffer* in_pBuffer, AkUInt32 in_ulOffset, AkAudioBuffer* out_pBuffer)
{
    const AkUInt32 uNumChannels = in_pBuffer->NumChannels();
    const AkUInt32 uNumFrames = in_pBuffer->uValidFrames;

    if (uNumFrames == 0)
        return;

    // Préparer pointeurs d'entrée/sortie
    std::vector<FAUSTFLOAT*> inputs(mDSP.getNumInputs());
    std::vector<FAUSTFLOAT*> outputs(mDSP.getNumOutputs());
    
    // Pour l’instant on suppose 1 in / 1 out
    inputs[0] = reinterpret_cast<FAUSTFLOAT*>(in_pBuffer->GetChannel(0) + in_ulOffset);
    outputs[0] = reinterpret_cast<FAUSTFLOAT*>(out_pBuffer->GetChannel(0) + out_pBuffer->uValidFrames);

    // Synchroniser les paramètres Faust
    float grain = m_pParams->RTPC.fGrainSize;
    float speed = m_pParams->RTPC.fSpeed;
    float prob = m_pParams->RTPC.fProbability;

    mUI.setParamValue("GrainSize", grain);
    mUI.setParamValue("Speed", speed);
    mUI.setParamValue("Probability", prob);

    // Buffer pour formatter le message
    //wchar_t msg[256];
    //swprintf(msg, 256, L"[JSgranulator] GrainSize=%.2f | Speed=%.2f | Probability=%.2f\n", grain, speed, prob);
    //AKPLATFORM::OutputDebugMsg(msg);

    // --- Traitement DSP ---
    mDSP.compute(uNumFrames, inputs.data(), outputs.data());

    // Si plusieurs canaux, copier le signal du premier canal traité
    for (AkUInt32 c = 1; c < uNumChannels; ++c)
    {
        AkReal32* outBuf = (AkReal32*)out_pBuffer->GetChannel(c) + out_pBuffer->uValidFrames;
        FAUSTFLOAT* firstChannel = outputs[0];
        for (AkUInt32 f = 0; f < uNumFrames; ++f)
            outBuf[f] = firstChannel[f];
    }

    // Mise à jour des compteurs
    out_pBuffer->uValidFrames += uNumFrames;
    in_pBuffer->uValidFrames = 0; // tout consommé

    // Mise à jour de l’état (logique Wwise)
    if (in_pBuffer->eState == AK_NoMoreData && in_pBuffer->uValidFrames == 0)
        out_pBuffer->eState = AK_NoMoreData;
    else if (out_pBuffer->uValidFrames == out_pBuffer->MaxFrames())
        out_pBuffer->eState = AK_DataReady;
    else
        out_pBuffer->eState = AK_DataNeeded;
}



AKRESULT JSgranulatorFX::TimeSkip(AkUInt32 &io_uFrames)
{
    return AK_DataReady;
}
