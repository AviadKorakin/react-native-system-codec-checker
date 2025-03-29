import Foundation
import AVFoundation
import VideoToolbox

@objc public class SystemCodecCheckerObjC: NSObject {

    @objc public class func isVideoCodecSupportedObjC(
        _ videoCodecType: NSString,
        pixelFormat: NSString,
        forEncoder: Bool,
        width: NSNumber?,
        height: NSNumber?
    ) -> Bool {
        guard let codec = VideoCodecType(rawValue: videoCodecType as String),
              let format = PixelFormat(rawValue: Int(pixelFormat as String) ?? 0) else {
            return false
        }
        let videoWidth: Int32? = width?.int32Value
        let videoHeight: Int32? = height?.int32Value
        return SystemCodecCheckerImp.isVideoCodecSupported(
            codecType: codec,
            pixelFormat: format,
            forEncoder: forEncoder,
            width: videoWidth,
            height: videoHeight
        )
    }

    @objc public class func isAudioCodecSupportedObjC(
        _ audioCodecType: NSString,
        forEncoder: Bool
    ) -> Bool {
        guard let codec = AudioCodecType(rawValue: audioCodecType as String) else {
            return false
        }
        return SystemCodecCheckerImp.isAudioCodecSupported(
            codecType: codec,
            forEncoder: forEncoder
        )
    }

    @objc public class func isCodecConfigurationSupportedObjC(
        _ videoCodecType: NSString,
        pixelFormat: NSString,
        audioCodecType: NSString,
        width: NSNumber?,
        height: NSNumber?
    ) -> Bool {
        guard let videoCodec = VideoCodecType(rawValue: videoCodecType as String),
              let format = PixelFormat(rawValue: Int(pixelFormat as String) ?? 0),
              let audioCodec = AudioCodecType(rawValue: audioCodecType as String) else {
            return false
        }
        let videoWidth: Int32? = width?.int32Value
        let videoHeight: Int32? = height?.int32Value
        return SystemCodecCheckerImp.isCodecConfigurationSupported(
            videoCodecType: videoCodec,
            pixelFormat: format,
            audioCodecType: audioCodec,
            width: videoWidth,
            height: videoHeight
        )
    }
}
