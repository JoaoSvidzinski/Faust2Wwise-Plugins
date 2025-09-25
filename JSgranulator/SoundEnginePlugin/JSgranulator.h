/* ------------------------------------------------------------
author: "Adapted from sfIter by Christophe Lebreton"
name: "JSgranulator", "Granulator"
Code generated with Faust 2.79.4 (https://faust.grame.fr)
Compilation options: -lang cpp -ct 1 -es 1 -mcd 16 -mdd 1024 -mdy 33 -single -ftz 0
------------------------------------------------------------ */

#ifndef  __mydsp_H__
#define  __mydsp_H__

#ifndef FAUSTFLOAT
#define FAUSTFLOAT float
#endif 

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <math.h>

#ifndef FAUSTCLASS 
#define FAUSTCLASS mydsp
#endif

#include <iostream>

#include "faust/dsp/dsp.h"
#include "faust/gui/PrintUI.h"
#include "faust/gui/MapUI.h"
#ifdef LAYOUT_UI
#include "faust/gui/LayoutUI.h"
#endif
#include "faust/gui/meta.h"
//#include "faust/audio/dummy-audio.h"
#ifdef FIXED_POINT
#include "faust/dsp/fixed-point.h"
#endif


#ifdef __APPLE__ 
#define exp10f __exp10f
#define exp10 __exp10
#endif

#if defined(_WIN32)
#define RESTRICT __restrict
#else
#define RESTRICT __restrict__
#endif


class mydsp : public dsp {
	
 private:
	
	FAUSTFLOAT fHslider0;
	float fVec0[2];
	int fSampleRate;
	float fConst0;
	float fConst1;
	float fConst2;
	float fConst3;
	float fRec1[2];
	float fConst4;
	FAUSTFLOAT fHslider1;
	float fRec4[2];
	float fVec1[2];
	int IOTA0;
	int iVec2[128];
	int iRec6[2];
	float fRec5[2];
	FAUSTFLOAT fHslider2;
	float fVec3[2];
	float fRec7[2];
	int iVec4[2];
	float fRec3[2];
	float fRec2[2];
	float fRec0[2];
	
 public:
	mydsp() {
	}
	
	void metadata(Meta* m) { 
		m->declare("analyzers.lib/name", "Faust Analyzer Library");
		m->declare("analyzers.lib/version", "1.2.0");
		m->declare("author", "Adapted from sfIter by Christophe Lebreton");
		m->declare("basics.lib/name", "Faust Basic Element Library");
		m->declare("basics.lib/version", "1.21.0");
		m->declare("compile_options", "-lang cpp -ct 1 -es 1 -mcd 16 -mdd 1024 -mdy 33 -single -ftz 0");
		m->declare("filename", "JSgranulator.dsp");
		m->declare("filters.lib/lowpass0_highpass1", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/lowpass0_highpass1:author", "Julius O. Smith III");
		m->declare("filters.lib/lowpass:author", "Julius O. Smith III");
		m->declare("filters.lib/lowpass:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/lowpass:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/name", "Faust Filters Library");
		m->declare("filters.lib/tf1:author", "Julius O. Smith III");
		m->declare("filters.lib/tf1:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/tf1:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/tf1s:author", "Julius O. Smith III");
		m->declare("filters.lib/tf1s:copyright", "Copyright (C) 2003-2019 by Julius O. Smith III <jos@ccrma.stanford.edu>");
		m->declare("filters.lib/tf1s:license", "MIT-style STK-4.3 license");
		m->declare("filters.lib/version", "1.7.1");
		m->declare("maths.lib/author", "GRAME");
		m->declare("maths.lib/copyright", "GRAME");
		m->declare("maths.lib/license", "LGPL with exception");
		m->declare("maths.lib/name", "Faust Math Library");
		m->declare("maths.lib/version", "2.8.1");
		m->declare("name", "JSgranulator");
		m->declare("noises.lib/name", "Faust Noise Generator Library");
		m->declare("noises.lib/version", "1.4.1");
		m->declare("platform.lib/name", "Generic Platform Library");
		m->declare("platform.lib/version", "1.3.0");
		m->declare("signals.lib/name", "Faust Signal Routing Library");
		m->declare("signals.lib/version", "1.6.0");
	}

	virtual int getNumInputs() {
		return 1;
	}
	virtual int getNumOutputs() {
		return 1;
	}
	
	static void classInit(int sample_rate) {
	}
	
	virtual void instanceConstants(int sample_rate) {
		fSampleRate = sample_rate;
		fConst0 = std::min<float>(1.92e+05f, std::max<float>(1.0f, float(fSampleRate)));
		fConst1 = 1.0f / std::tan(3.1415927f / fConst0);
		fConst2 = 1.0f - fConst1;
		fConst3 = 1.0f / (fConst1 + 1.0f);
		fConst4 = 1.0f / fConst0;
	}
	
	virtual void instanceResetUserInterface() {
		fHslider0 = FAUSTFLOAT(1e+01f);
		fHslider1 = FAUSTFLOAT(2e+02f);
		fHslider2 = FAUSTFLOAT(7e+01f);
	}
	
	virtual void instanceClear() {
		for (int l0 = 0; l0 < 2; l0 = l0 + 1) {
			fVec0[l0] = 0.0f;
		}
		for (int l1 = 0; l1 < 2; l1 = l1 + 1) {
			fRec1[l1] = 0.0f;
		}
		for (int l2 = 0; l2 < 2; l2 = l2 + 1) {
			fRec4[l2] = 0.0f;
		}
		for (int l3 = 0; l3 < 2; l3 = l3 + 1) {
			fVec1[l3] = 0.0f;
		}
		IOTA0 = 0;
		for (int l4 = 0; l4 < 128; l4 = l4 + 1) {
			iVec2[l4] = 0;
		}
		for (int l5 = 0; l5 < 2; l5 = l5 + 1) {
			iRec6[l5] = 0;
		}
		for (int l6 = 0; l6 < 2; l6 = l6 + 1) {
			fRec5[l6] = 0.0f;
		}
		for (int l7 = 0; l7 < 2; l7 = l7 + 1) {
			fVec3[l7] = 0.0f;
		}
		for (int l8 = 0; l8 < 2; l8 = l8 + 1) {
			fRec7[l8] = 0.0f;
		}
		for (int l9 = 0; l9 < 2; l9 = l9 + 1) {
			iVec4[l9] = 0;
		}
		for (int l10 = 0; l10 < 2; l10 = l10 + 1) {
			fRec3[l10] = 0.0f;
		}
		for (int l11 = 0; l11 < 2; l11 = l11 + 1) {
			fRec2[l11] = 0.0f;
		}
		for (int l12 = 0; l12 < 2; l12 = l12 + 1) {
			fRec0[l12] = 0.0f;
		}
	}
	
	virtual void init(int sample_rate) {
		classInit(sample_rate);
		instanceInit(sample_rate);
	}
	
	virtual void instanceInit(int sample_rate) {
		instanceConstants(sample_rate);
		instanceResetUserInterface();
		instanceClear();
	}
	
	virtual mydsp* clone() {
		return new mydsp();
	}
	
	virtual int getSampleRate() {
		return fSampleRate;
	}
	
	virtual void buildUserInterface(UI* ui_interface) {
		ui_interface->openVerticalBox("Granulator");
		ui_interface->openHorizontalBox("Granulator");
		ui_interface->declare(&fHslider1, "1", "");
		ui_interface->declare(&fHslider1, "BELA", "ANALOG_0");
		ui_interface->addHorizontalSlider("GrainSize", &fHslider1, FAUSTFLOAT(2e+02f), FAUSTFLOAT(5.0f), FAUSTFLOAT(2205.0f), FAUSTFLOAT(1.0f));
		ui_interface->declare(&fHslider0, "2", "");
		ui_interface->declare(&fHslider0, "BELA", "ANALOG_1");
		ui_interface->addHorizontalSlider("Speed", &fHslider0, FAUSTFLOAT(1e+01f), FAUSTFLOAT(1.0f), FAUSTFLOAT(2e+01f), FAUSTFLOAT(0.0001f));
		ui_interface->declare(&fHslider2, "3", "");
		ui_interface->declare(&fHslider2, "BELA", "ANALOG_2");
		ui_interface->addHorizontalSlider("Probability", &fHslider2, FAUSTFLOAT(7e+01f), FAUSTFLOAT(0.0f), FAUSTFLOAT(1e+02f), FAUSTFLOAT(1.0f));
		ui_interface->closeBox();
		ui_interface->closeBox();
	}
	
	virtual void compute(int count, FAUSTFLOAT** RESTRICT inputs, FAUSTFLOAT** RESTRICT outputs) {
		FAUSTFLOAT* input0 = inputs[0];
		FAUSTFLOAT* output0 = outputs[0];
		float fSlow0 = float(fHslider0);
		float fSlow1 = 1.0f / float(fHslider1);
		float fSlow2 = float(fHslider2);
		for (int i0 = 0; i0 < count; i0 = i0 + 1) {
			fVec0[0] = fSlow0;
			fRec1[0] = -(fConst3 * (fConst2 * fRec1[1] - (fSlow0 + fVec0[1])));
			float fTemp0 = 0.0625f / fRec1[0];
			int iTemp1 = std::fabs(fTemp0) < 1.1920929e-07f;
			float fTemp2 = ((iTemp1) ? 0.0f : std::exp(-(fConst4 / ((iTemp1) ? 1.0f : fTemp0))));
			float fTemp3 = 1.0f - fTemp2;
			fRec4[0] = std::fmod(fRec4[1] + fConst4 * fRec1[0], 1.0f);
			float fTemp4 = fRec4[0] + -0.001f;
			fVec1[0] = fTemp4;
			iVec2[IOTA0 & 127] = fTemp4 < 0.5f;
			int iTemp5 = (fVec1[1] <= 0.0f) & (fTemp4 > 0.0f);
			iRec6[0] = 1103515245 * iRec6[1] + 12345;
			float fTemp6 = float(iRec6[0]);
			fRec5[0] = fRec5[1] * float(1 - iTemp5) + std::fabs(4.656613e-10f * fTemp6) * float(iTemp5);
			fVec3[0] = fSlow2;
			fRec7[0] = fConst3 * (0.01f * (fSlow2 + fVec3[1]) - fConst2 * fRec7[1]);
			int iTemp7 = (fRec7[0] > fRec5[0]) * iVec2[(IOTA0 - 100) & 127];
			iVec4[0] = iTemp7;
			fRec3[0] = fRec3[1] + float((iTemp7 - iVec4[1]) > 0) - fSlow1 * float(fRec3[1] > 0.0f);
			float fTemp8 = std::fabs(4.656613e-10f * fTemp6 * float(fRec3[0] > 0.0f));
			fRec2[0] = std::max<float>(fTemp8, fTemp2 * fRec2[1] + fTemp3 * fTemp8);
			fRec0[0] = fRec2[0] * fTemp3 + fTemp2 * fRec0[1];
			output0[i0] = FAUSTFLOAT(float(input0[i0]) * fRec0[0]);
			fVec0[1] = fVec0[0];
			fRec1[1] = fRec1[0];
			fRec4[1] = fRec4[0];
			fVec1[1] = fVec1[0];
			IOTA0 = IOTA0 + 1;
			iRec6[1] = iRec6[0];
			fRec5[1] = fRec5[0];
			fVec3[1] = fVec3[0];
			fRec7[1] = fRec7[0];
			iVec4[1] = iVec4[0];
			fRec3[1] = fRec3[0];
			fRec2[1] = fRec2[0];
			fRec0[1] = fRec0[0];
		}
	}

};

#endif
