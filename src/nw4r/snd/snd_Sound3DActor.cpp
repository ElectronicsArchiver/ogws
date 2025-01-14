#include "snd_Pan.h"
#include "snd_SoundArchive.h"
#include "snd_SoundArchivePlayer.h"
#include "snd_SoundHandle.h"
#include "snd_Sound3DManager.h"
#include "snd_Sound3DActor.h"

namespace nw4r
{
	using namespace ut;
	
	namespace snd
	{
		using namespace detail;
		
		Sound3DActor::Sound3DActor(SoundArchivePlayer & archivePlayer, Sound3DManager & manager)
			: SoundActor(archivePlayer), mManager(manager), mArchivePlayer(archivePlayer)
		{}
		
		Sound3DActor::~Sound3DActor()
		{
			ExternalSoundPlayer * pPlayer = mPlayers;
			
			for (int i = 0; i < SOUND_PLAYERS_PER_ACTOR; i++)
			{
				LinkList<BasicSound, 0xD0>::Iterator iter(pPlayer->mSoundList.GetBeginIter());
				
				while (iter != pPlayer->mSoundList.GetEndIter())
				{
					BasicSound * pSound = &*iter++;
					
					SoundHandle handle;
					
					handle.detail_AttachSoundAsTempHandle(pSound);
					
					if (handle.mSound) handle.mSound->mAmbientArgUpdateCallback = NULL;
				}
				
				pPlayer++;
			}
		}
		
		UNKWORD Sound3DActor::detail_SetupSound(SoundHandle * pHandle, /* at r4 (r28) */
			u32 r29_5,
			BasicSound::AmbientArgInfo *, /* at r6 */
			ExternalSoundPlayer *, /* at r7 */
			bool r8_30,
			const SoundStartable::StartInfo * mStartInfo /* at r9 (r31)*/)
		{
			//r27 <- this
			
			Sound3DManager::Sound3DActorParam actorParam; // at 0x28
			
			SoundArchive::Sound3DParam param; // at 0x8
			
			actorParam.mPosition = mPosition;
			actorParam.WORD_0x0 = WORD_0xB4;
			
			if (mArchivePlayer.GetSoundArchive()->detail_ReadSound3DParam(r29_5, &param))
			{
				actorParam.mSound3DParam = param;
			}
			
			BasicSound::AmbientArgInfo ambientArgInfo = {
				&mManager,
				this,
				&mManager,
				&actorParam,
				0x18
			}; // at 0x10
			
			UNKWORD ret = mArchivePlayer.detail_SetupSound(pHandle,
				r29_5,
				&ambientArgInfo,
				mPlayers,
				r8_30,
				mStartInfo);
			
			if (pHandle->mSound) pHandle->mSound->SetPanCurve(PAN_CURVE_3);
			
			return ret;
		}
		
		void Sound3DActor::SetPosition(const math::VEC3 & position)
		{
			mPosition.mCoords = position.mCoords;
		}
		
		void Sound3DActor::detail_Update(void * ptr, const BasicSound * pSound)
		{
			Sound3DManager::Sound3DActorParam * pActorParam = static_cast<Sound3DManager::Sound3DActorParam *>(ptr);
			
			pActorParam->mPosition = mPosition;
			pActorParam->WORD_0x0 = WORD_0xB4;
		}
	}
}