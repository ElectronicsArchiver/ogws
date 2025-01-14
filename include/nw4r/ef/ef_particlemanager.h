#ifndef NW4R_EF_PARTICLEMANAGER
#define NW4R_EF_PARTICLEMANAGER
#include "types_nw4r.h"
#include "math_types.h"
#include "ef_list.h"
#include "ef_ref.h"

namespace nw4r
{
	namespace ef
	{
		struct ParticleManager : ReferencedObject
		{
			UNKTYPE BeginDraw();
			UNKTYPE EndDraw();
			UNKTYPE BeginCalc(bool);
			UNKTYPE EndCalc();
			
			bool SendClosing();
			UNKTYPE DestroyFunc();
			virtual bool Initialize(Emitter *, EmitterResource *);
			virtual UNKTYPE CreateParticle(u16, math::VEC3, math::VEC3, const math::MTX34 *, float, const EmitterInheritSetting *, Particle *, u16);
			virtual UNKTYPE Calc();
			virtual UNKTYPE Draw(const DrawInfo &);
			
			Emitter * mEmitter; // at 0x20
			EmitterResource * mResource; // at 0x24
			UNKWORD FLAGS_0x28;
			char UNK_0x2C[0xC];
			ActivityList EFLIST_0x38;
			char UNK_0x54[0x34];
			
			s8 BYTE_0x88;
			u8 BYTE_0x89;
			bool BOOL_0x8A;
			
			UNKWORD FLAGS_0xB4;
			
			u16 RetireParticleAll();
			
			UNKTYPE CalcGlobalMtx(math::MTX34 *);
		};
	}
}

#endif