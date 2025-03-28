import Foundation
import VideoToolbox

public enum VideoCodecType: String {
    // Existing types
    case H263 = "H263"         // Typically “H263”
    case MPEG4 = "MPEG4"       // MPEG-4 Part 2
    case H264 = "H264"         // H.264/AVC
    case HEVC = "HEVC"         // H.265/HEVC
    case VP8 = "VP8"           // VP8
    case VP9 = "VP9"           // VP9
    case AV1 = "AV1"           // AV1
    case MPEG2 = "MPEG2"       // MPEG-2
    case DOLBY_VISION = "DOLBY_VISION" // Dolby Vision

    // Additional codecs Apple supports
    case ANIMATION = "ANIMATION"             // Apple Animation format
    case CINEPAK = "CINEPAK"                 // Cinepak format
    case JPEG = "JPEG"                       // JPEG format
    case JPEG_OPEN_DML = "JPEG_OPEN_DML"     // JPEG with Open-DML extensions
    case SORENSON_VIDEO = "SORENSON_VIDEO"    // Sorenson video format
    case SORENSON_VIDEO3 = "SORENSON_VIDEO3"  // Sorenson 3 video format
    // case MPEG1 = "MPEG1"                  // MPEG-1 video (if needed)
    case DVC_NTSC = "DVC_NTSC"                // DV NTSC format
    case DVC_PAL = "DVC_PAL"                  // DV PAL format
    case DVC_PRO_PAL = "DVC_PRO_PAL"          // Panasonic DVCPro PAL
    case DVC_PRO50_NTSC = "DVC_PRO50_NTSC"      // Panasonic DVCPro-50 NTSC
    case DVC_PRO50_PAL = "DVC_PRO50_PAL"        // Panasonic DVCPro-50 PAL
    case DVCPRO_HD_720P60 = "DVCPRO_HD_720P60"   // Panasonic DVCPRO HD 720p60
    case DVCPRO_HD_720P50 = "DVCPRO_HD_720P50"   // Panasonic DVCPRO HD 720p50
    case DVCPRO_HD_1080I60 = "DVCPRO_HD_1080I60"  // Panasonic DVCPRO HD 1080i60
    case DVCPRO_HD_1080I50 = "DVCPRO_HD_1080I50"  // Panasonic DVCPRO HD 1080i50
    case DVCPRO_HD_1080P30 = "DVCPRO_HD_1080P30"  // Panasonic DVCPRO HD 1080p30
    case DVCPRO_HD_1080P25 = "DVCPRO_HD_1080P25"  // Panasonic DVCPRO HD 1080p25
    case APPLE_PRORES_4444_XQ = "APPLE_PRORES_4444_XQ" // Apple ProRes 4444 XQ
    case APPLE_PRORES_4444 = "APPLE_PRORES_4444"  // Apple ProRes 4444
    case APPLE_PRORES_422_HQ = "APPLE_PRORES_422_HQ" // Apple ProRes 422 HQ
    case APPLE_PRORES_422 = "APPLE_PRORES_422"    // Apple ProRes 422
    case APPLE_PRORES_422_LT = "APPLE_PRORES_422_LT" // Apple ProRes 422 LT
    case APPLE_PRORES_422_PROXY = "APPLE_PRORES_422_PROXY" // Apple ProRes 422 Proxy
    case APPLE_PRORES_RAW = "APPLE_PRORES_RAW"    // Apple ProRes RAW
    case APPLE_PRORES_RAW_HQ = "APPLE_PRORES_RAW_HQ" // Apple ProRes RAW HQ
    case DISPARITY_HEVC = "DISPARITY_HEVC"  // Disparity HEVC (for 10-bit monochrome disparity maps)
    case DEPTH_HEVC = "DEPTH_HEVC"         // Depth HEVC (for depth maps)

    /// Returns the MIME type for the codec.
    public var mimeType: String {
        switch self {
        case .H263:                 return "video/3gpp"
        case .MPEG4:                return "video/mp4v-es"
        case .H264:                 return "video/avc"
        case .HEVC:                 return "video/hevc"
        case .VP8:                  return "video/x-vnd.on2.vp8"
        case .VP9:                  return "video/x-vnd.on2.vp9"
        case .AV1:                  return "video/av01"
        case .MPEG2:                return "video/mpeg2"
        case .DOLBY_VISION:         return "video/dolby-vision"
            
        // Additional codecs
        case .ANIMATION:            return "video/animation"
        case .CINEPAK:              return "video/cinepak"
        case .JPEG:                 return "video/jpeg"
        case .JPEG_OPEN_DML:        return "video/jpeg-opendml"
        case .SORENSON_VIDEO:       return "video/sorenson"
        case .SORENSON_VIDEO3:      return "video/sorenson3"
        case .DVC_NTSC:             return "video/dvcntsc"
        case .DVC_PAL:              return "video/dvcpal"
        case .DVC_PRO_PAL:          return "video/dvcpropal"
        case .DVC_PRO50_NTSC:       return "video/dvcpro50ntsc"
        case .DVC_PRO50_PAL:        return "video/dvcpro50pal"
        case .DVCPRO_HD_720P60:     return "video/dvcpprohd720p60"
        case .DVCPRO_HD_720P50:     return "video/dvcpprohd720p50"
        case .DVCPRO_HD_1080I60:    return "video/dvcpprohd1080i60"
        case .DVCPRO_HD_1080I50:    return "video/dvcpprohd1080i50"
        case .DVCPRO_HD_1080P30:    return "video/dvcpprohd1080p30"
        case .DVCPRO_HD_1080P25:    return "video/dvcpprohd1080p25"
        case .APPLE_PRORES_4444_XQ: return "video/appleprores4444xq"
        case .APPLE_PRORES_4444:    return "video/appleprores4444"
        case .APPLE_PRORES_422_HQ:  return "video/appleprores422hq"
        case .APPLE_PRORES_422:     return "video/appleprores422"
        case .APPLE_PRORES_422_LT:  return "video/appleprores422lt"
        case .APPLE_PRORES_422_PROXY: return "video/appleprores422proxy"
        case .APPLE_PRORES_RAW:     return "video/appleproresraw"
        case .APPLE_PRORES_RAW_HQ:  return "video/appleproresrawhq"
        case .DISPARITY_HEVC:       return "video/disparityhevc"
        case .DEPTH_HEVC:           return "video/depthhevc"
        }
    }
    
    /// Returns the CMVideoCodecType (FourCC) for the codec.
    public var systemCodecType: CMVideoCodecType? {
        switch self {
        case .H263:
            return kCMVideoCodecType_H263
        case .MPEG4:
            return kCMVideoCodecType_MPEG4Video
        case .H264:
            return kCMVideoCodecType_H264
        case .HEVC:
            return kCMVideoCodecType_HEVC
        case .VP8:
            // FourCC for "vp80" (0x76703830)
            return 0x76703830
        case .VP9:
            return kCMVideoCodecType_VP9
        case .AV1:
            return kCMVideoCodecType_AV1
        case .MPEG2:
            return kCMVideoCodecType_MPEG2Video
        case .DOLBY_VISION:
            return kCMVideoCodecType_DolbyVisionHEVC
            
        // Additional codecs
        case .ANIMATION:
            return kCMVideoCodecType_Animation
        case .CINEPAK:
            return kCMVideoCodecType_Cinepak
        case .JPEG:
            return kCMVideoCodecType_JPEG
        case .JPEG_OPEN_DML:
            return kCMVideoCodecType_JPEG_OpenDML
        case .SORENSON_VIDEO:
            return kCMVideoCodecType_SorensonVideo
        case .SORENSON_VIDEO3:
            return kCMVideoCodecType_SorensonVideo3
        case .DVC_NTSC:
            return kCMVideoCodecType_DVCNTSC
        case .DVC_PAL:
            return kCMVideoCodecType_DVCPAL
        case .DVC_PRO_PAL:
            return kCMVideoCodecType_DVCProPAL
        case .DVC_PRO50_NTSC:
            return kCMVideoCodecType_DVCPro50NTSC
        case .DVC_PRO50_PAL:
            return kCMVideoCodecType_DVCPro50PAL
        case .DVCPRO_HD_720P60:
            return kCMVideoCodecType_DVCPROHD720p60
        case .DVCPRO_HD_720P50:
            return kCMVideoCodecType_DVCPROHD720p50
        case .DVCPRO_HD_1080I60:
            return kCMVideoCodecType_DVCPROHD1080i60
        case .DVCPRO_HD_1080I50:
            return kCMVideoCodecType_DVCPROHD1080i50
        case .DVCPRO_HD_1080P30:
            return kCMVideoCodecType_DVCPROHD1080p30
        case .DVCPRO_HD_1080P25:
            return kCMVideoCodecType_DVCPROHD1080p25
        case .APPLE_PRORES_4444_XQ:
            return kCMVideoCodecType_AppleProRes4444XQ
        case .APPLE_PRORES_4444:
            return kCMVideoCodecType_AppleProRes4444
        case .APPLE_PRORES_422_HQ:
            return kCMVideoCodecType_AppleProRes422HQ
        case .APPLE_PRORES_422:
            return kCMVideoCodecType_AppleProRes422
        case .APPLE_PRORES_422_LT:
            return kCMVideoCodecType_AppleProRes422LT
        case .APPLE_PRORES_422_PROXY:
            return kCMVideoCodecType_AppleProRes422Proxy
        case .APPLE_PRORES_RAW:
            return kCMVideoCodecType_AppleProResRAW
        case .APPLE_PRORES_RAW_HQ:
            return kCMVideoCodecType_AppleProResRAWHQ
        case .DISPARITY_HEVC:
            return kCMVideoCodecType_DisparityHEVC
        case .DEPTH_HEVC:
            return kCMVideoCodecType_DepthHEVC
        }
    }
}
