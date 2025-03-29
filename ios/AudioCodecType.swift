import Foundation
import AudioToolbox
import CoreAudio

public enum AudioCodecType: String {
case AAC = "AAC"         // Advanced Audio Coding (AAC)
case AC3 = "AC3"         // Dolby Digital (AC-3)
case _60958AC3 = "_60958AC3"     // 60958 AC-3
case APPLE_IMA4 = "APPLE_IMA4"    // Apple IMA4
case MPEG4AAC = "MPEG4AAC"       // MPEG-4 AAC
case MPEG4CELP = "MPEG4CELP"     // MPEG-4 CELP
case MPEG4HVXC = "MPEG4HVXC"     // MPEG-4 HVXC
case MPEG4TWINVQ = "MPEG4TWINVQ" // MPEG-4 TwinVQ
case MACE3 = "MACE3"             // MACE3
case MACE6 = "MACE6"             // MACE6
case ULAW = "ULAW"               // μLaw
case ALAW = "ALAW"               // aLaw
case QDESIGN = "QDESIGN"         // QDesign
case QDESIGN2 = "QDESIGN2"       // QDesign2
case QUALCOMM = "QUALCOMM"       // QUALCOMM
case MPEGLAYER1 = "MPEGLAYER1"   // MPEG Layer 1
case MPEGLAYER2 = "MPEGLAYER2"   // MPEG Layer 2
case MPEGLAYER3 = "MPEGLAYER3"   // MPEG Layer 3 (MP3)
case TIMECODE = "TIMECODE"       // Time code
case MIDI_STREAM = "MIDI_STREAM"        // MIDI stream
case PARAMETER_VALUE_STREAM = "PARAMETER_VALUE_STREAM" // Parameter value stream
case APPLE_LOSSLESS = "APPLE_LOSSLESS"      // Apple Lossless

// Extended types with no (or less common) native support:
case E_AC3 = "E_AC3"             // Enhanced AC-3 (E-AC-3)
case DTS = "DTS"            // DTS
case DTS_HD = "DTS_HD"       // DTS-HD
case TRUE_HD = "TRUE_HD"        // Dolby TrueHD
case OPUS = "OPUS"              // Opus
case VORBIS = "VORBIS"          // Vorbis
case FLAC = "FLAC"              // FLAC
case AMR_NB = "AMR_NB"          // AMR Narrowband
case AMR_WB = "AMR_WB"          // AMR Wideband
case MPEG_H = "MPEG_H"           // MPEG-H 3D Audio

// Additional extended types (newly added)
case AUDIBLE = "AUDIBLE"        // Audible codec
case ILBC = "ILBC"              // iLBC codec
case DVI_INTEL_IMA = "DVI_INTEL_IMA"    // DVI Intel IMA
case MICROSOFT_GSM = "MICROSOFT_GSM" // Microsoft GSM
case AES3 = "AES3"              // AES3
case ENHANCED_AC3 = "ENHANCED_AC3" // Enhanced AC-3
case APAC = "APAC"


// MPEG-4 AAC variants
case MPEG4AAC_HE = "MPEG4AAC_HE"         // HE-AAC
case MPEG4AAC_LD = "MPEG4AAC_LD"           // Low Delay AAC
case MPEG4AAC_ELD = "MPEG4AAC_ELD"         // Enhanced Low Delay AAC
case MPEG4AAC_ELD_SBR = "MPEG4AAC_ELD_SBR"   // ELD with SBR
case MPEG4AAC_ELD_V2 = "MPEG4AAC_ELD_V2"     // ELD v2
case MPEG4AAC_HE_V2 = "MPEG4AAC_HE_V2"       // HE-AAC v2
case MPEG4AAC_SPATIAL = "MPEG4AAC_SPATIAL"   // Spatial Audio AAC
case MPEGD_USAC = "MPEGD_USAC"             // MPEG-D USAC

// Added PCM case
case PCM_CODEC = "PCM_CODEC"              // Linear PCM
}

extension AudioCodecType {
/// Computed property to return the MIME type associated with the codec.
  public var mimeType: String {
    switch self {
    case .AAC: return "audio/mp4a-latm"
    case .AC3: return "audio/ac3"
    case ._60958AC3: return "audio/60958ac3"
    case .APPLE_IMA4: return "audio/appleima4"
    case .MPEG4AAC: return "audio/mpeg4aac"
    case .MPEG4CELP: return "audio/mpeg4celp"
    case .MPEG4HVXC: return "audio/mpeg4hvxc"
    case .MPEG4TWINVQ: return "audio/mpeg4twinvq"
    case .MACE3: return "audio/mace3"
    case .MACE6: return "audio/mace6"
    case .ULAW: return "audio/ulaw"
    case .ALAW: return "audio/alaw"
    case .QDESIGN: return "audio/qdesign"
    case .QDESIGN2: return "audio/qdesign2"
    case .QUALCOMM: return "audio/qualcomm"
    case .MPEGLAYER1: return "audio/mpeglayer1"
    case .MPEGLAYER2: return "audio/mpeglayer2"
    case .MPEGLAYER3: return "audio/mpeglayer3"
    case .TIMECODE: return "audio/timecode"
    case .MIDI_STREAM: return "audio/midi"
    case .PARAMETER_VALUE_STREAM: return "audio/parameter"
    case .APPLE_LOSSLESS: return "audio/applelossless"
      
    case .E_AC3: return "audio/eac3"
    case .DTS: return "audio/vnd.dts"
    case .DTS_HD: return "audio/vnd.dts.hd"
    case .TRUE_HD: return "audio/true-hd"
    case .OPUS: return "audio/opus"
    case .VORBIS: return "audio/vorbis"
    case .FLAC: return "audio/flac"
    case .AMR_NB: return "audio/amr-nb"
    case .AMR_WB: return "audio/amr-wb"
    case .MPEG_H: return "audio/mpegh"
      
    case .AUDIBLE: return "audio/audible"
    case .ILBC: return "audio/ilbc"
    case .DVI_INTEL_IMA: return "audio/dviima"
    case .MICROSOFT_GSM: return "audio/microsoftgsm"
    case .AES3: return "audio/aes3"
    case .ENHANCED_AC3: return "audio/enhancedac3"
    
    case .APAC: return "audio/apac"
      
    case .MPEG4AAC_HE: return "audio/mpeg4aac-he"
    case .MPEG4AAC_LD: return "audio/mpeg4aac-ld"
    case .MPEG4AAC_ELD: return "audio/mpeg4aac-eld"
    case .MPEG4AAC_ELD_SBR: return "audio/mpeg4aac-eld-sbr"
    case .MPEG4AAC_ELD_V2: return "audio/mpeg4aac-eld-v2"
    case .MPEG4AAC_HE_V2: return "audio/mpeg4aac-he-v2"
    case .MPEG4AAC_SPATIAL: return "audio/mpeg4aac-spatial"
    case .MPEGD_USAC: return "audio/mpegd-usac"
    case .PCM_CODEC: return "audio/pcm"
    }
  }

    /// Returns the AudioFormatID constant if provided by AudioToolbox.
    public var formatID: AudioFormatID? {
        switch self {
        case .AAC, .MPEG4AAC:
            return kAudioFormatMPEG4AAC
        case .AC3:
            return kAudioFormatAC3
        case ._60958AC3:
            return kAudioFormat60958AC3
        case .APPLE_IMA4:
            return kAudioFormatAppleIMA4
        case .MPEG4CELP:
            return kAudioFormatMPEG4CELP
        case .MPEG4HVXC:
            return kAudioFormatMPEG4HVXC
        case .MPEG4TWINVQ:
            return kAudioFormatMPEG4TwinVQ
        case .MACE3:
            return kAudioFormatMACE3
        case .MACE6:
            return kAudioFormatMACE6
        case .ULAW:
            return kAudioFormatULaw
        case .ALAW:
            return kAudioFormatALaw
        case .QDESIGN:
            return kAudioFormatQDesign
        case .QDESIGN2:
            return kAudioFormatQDesign2
        case .QUALCOMM:
            return kAudioFormatQUALCOMM
        case .MPEGLAYER1:
            return kAudioFormatMPEGLayer1
        case .MPEGLAYER2:
            return kAudioFormatMPEGLayer2
        case .MPEGLAYER3:
            return kAudioFormatMPEGLayer3
        case .TIMECODE:
            return kAudioFormatTimeCode
        case .MIDI_STREAM:
            return kAudioFormatMIDIStream
        case .PARAMETER_VALUE_STREAM:
            return kAudioFormatParameterValueStream
        case .APPLE_LOSSLESS:
            return kAudioFormatAppleLossless
        case .MPEG4AAC_HE:
            return kAudioFormatMPEG4AAC_HE
        case .MPEG4AAC_LD:
            return kAudioFormatMPEG4AAC_LD
        case .MPEG4AAC_ELD:
            return kAudioFormatMPEG4AAC_ELD
        case .MPEG4AAC_ELD_SBR:
            return kAudioFormatMPEG4AAC_ELD_SBR
        case .MPEG4AAC_ELD_V2:
            return kAudioFormatMPEG4AAC_ELD_V2
        case .MPEG4AAC_HE_V2:
            return kAudioFormatMPEG4AAC_HE_V2
        case .MPEG4AAC_SPATIAL:
            return kAudioFormatMPEG4AAC_Spatial
        case .MPEGD_USAC:
            return kAudioFormatMPEGD_USAC
        case .AMR_NB:
            return kAudioFormatAMR
        case .AMR_WB:
            return kAudioFormatAMR_WB
        case .AUDIBLE:
            return kAudioFormatAudible
        case .ILBC:
            return kAudioFormatiLBC
        case .DVI_INTEL_IMA:
            return kAudioFormatDVIIntelIMA
        case .MICROSOFT_GSM:
            return kAudioFormatMicrosoftGSM
        case .AES3:
            return kAudioFormatAES3
        case .ENHANCED_AC3:
            return kAudioFormatEnhancedAC3
        case .FLAC:
            return kAudioFormatFLAC
        case .OPUS:
            return kAudioFormatOpus
       #if os(macOS)
        case .APAC:
            if #available(macOS 10.15, *) {
                return kAudioFormatAPAC
            } else {
                return nil
            }
        #endif
        case .PCM_CODEC:
            return kAudioFormatLinearPCM
        default:
          return nil
        }
    }
    
    /// Provides a default AudioStreamBasicDescription for encoder testing.
    /// These defaults use typical values; adjust them as needed.
    public var defaultASBDForEncoder: AudioStreamBasicDescription? {
        switch self {
        case .AAC, .MPEG4AAC:
            return AudioStreamBasicDescription(
                mSampleRate: 44100,
                mFormatID: kAudioFormatMPEG4AAC,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 1024,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .AC3:
            return AudioStreamBasicDescription(
                mSampleRate: 48000,
                mFormatID: kAudioFormatAC3,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 1536,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .PCM_CODEC:
            return AudioStreamBasicDescription(
                mSampleRate: 44100,
                mFormatID: kAudioFormatLinearPCM,
                mFormatFlags: kLinearPCMFormatFlagIsSignedInteger | kLinearPCMFormatFlagIsPacked,
                mBytesPerPacket: 4,
                mFramesPerPacket: 1,
                mBytesPerFrame: 4,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 16,
                mReserved: 0)
        case .MPEGLAYER3:
            return AudioStreamBasicDescription(
                mSampleRate: 44100,
                mFormatID: kAudioFormatMPEGLayer3,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 1152,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .APPLE_LOSSLESS:
            return AudioStreamBasicDescription(
                mSampleRate: 44100,
                mFormatID: kAudioFormatAppleLossless,
                mFormatFlags: kAppleLosslessFormatFlag_16BitSourceData,
                mBytesPerPacket: 0,
                mFramesPerPacket: 4096,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .AMR_NB:
            return AudioStreamBasicDescription(
                mSampleRate: 8000,
                mFormatID: kAudioFormatAMR,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 160,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 1,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .AMR_WB:
            return AudioStreamBasicDescription(
                mSampleRate: 16000,
                mFormatID: kAudioFormatAMR_WB,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 320,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 1,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .OPUS:
            return AudioStreamBasicDescription(
                mSampleRate: 48000,
                mFormatID: kAudioFormatOpus,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 960,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        case .FLAC:
            return AudioStreamBasicDescription(
                mSampleRate: 44100,
                mFormatID: kAudioFormatFLAC,
                mFormatFlags: 0,
                mBytesPerPacket: 0,
                mFramesPerPacket: 4096,
                mBytesPerFrame: 0,
                mChannelsPerFrame: 2,
                mBitsPerChannel: 0,
                mReserved: 0)
        default:
            return nil
        }
    }
    
    public var defaultASBDForDecoder: AudioStreamBasicDescription? {
        return self.defaultASBDForEncoder
    }
}
