import Foundation
import AVFoundation
import VideoToolbox

@objc public enum VideoCodecTypeObjC: Int {
    case H263, MPEG4, H264, HEVC, VP8, VP9, AV1, MPEG2, DOLBY_VISION
    // Map these cases as needed.
}

@objc public enum PixelFormatObjC: Int {
    case colorFormatYUV420Flexible = 2135033992
    // Add other cases if needed.
}

@objc public enum AudioCodecTypeObjC: Int {
    case aac = 0
    // Add other cases as needed.
}

@objc public class SystemCodecCheckerObjC: NSObject {
    @objc public class func multiplyObjC(_ a: Double, b: Double) -> NSNumber {
        return NSNumber(value: a * b)
    }

    @objc public class func isVideoCodecSupportedObjC(_ videoCodecType: NSString,
                                                       pixelFormat: NSString,
                                                       forEncoder: Bool) -> Bool {
        // Convert NSString values to your Swift enums.
        guard let codec = VideoCodecType(rawValue: videoCodecType as String),
              let format = PixelFormat(rawValue: Int(pixelFormat as String) ?? 0) else {
            return false
        }
        
        return SystemCodecCheckerImp.isVideoCodecSupported(codecType: codec,
                                                        pixelFormat: format,
                                                        forEncoder: forEncoder)
    }

    @objc public class func isAudioCodecSupportedObjC(_ audioCodecType: NSString,
                                                       forEncoder: Bool) -> Bool {
        guard let codec = AudioCodecType(rawValue: audioCodecType as String) else {
            return false
        }
      return SystemCodecCheckerImp.isAudioCodecSupported(codecType: codec, forEncoder: forEncoder)
    }

    @objc public class func isCodecConfigurationSupportedObjC(_ videoCodecType: NSString,
                                                               pixelFormat: NSString,
                                                               audioCodecType: NSString) -> Bool {
        guard let videoCodec = VideoCodecType(rawValue: videoCodecType as String),
              let format = PixelFormat(rawValue: Int(pixelFormat as String) ?? 0),
              let audioCodec = AudioCodecType(rawValue: audioCodecType as String) else {
            return false
        }
        return SystemCodecCheckerImp.isCodecConfigurationSupported(videoCodecType: videoCodec,
                                                                pixelFormat: format,
                                                                audioCodecType: audioCodec)
    }
}
