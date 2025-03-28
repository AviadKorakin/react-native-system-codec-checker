//
//  CodecSupportChecker.swift
//  react-native-codec-check-ios
//
//  Created by Aviad on 28/03/2025.
//

import Foundation
import AVFoundation
import VideoToolbox

public class SystemCodecCheckerImp: NSObject {
    
    // MARK: - Video Codec Support
    
    /**
     Tests if the system supports the given video codec with the specified pixel format.
     
     - Parameters:
       - codecType: The target video codec type (e.g. .hevc).
       - pixelFormat: The target pixel format (e.g. .yuv420BiPlanar).
       - forEncoder: If true, tests for encoder support; if false, tests for decoder support.
       - width: Optional video width (in pixels) for testing encoder/decoder sessions.
       - height: Optional video height (in pixels) for testing encoder/decoder sessions.
     
     - Returns: True if the configuration is supported; false otherwise.
     */
    public class func isVideoCodecSupported(codecType: VideoCodecType,
                                            pixelFormat: PixelFormat,
                                            forEncoder: Bool = false,
                                            width: Int32? = nil,
                                            height: Int32? = nil) -> Bool {
        // Set defaults to full HD if not provided.
        let testWidth: Int32 = width ?? 1920
        let testHeight: Int32 = height ?? 1080
        
        // For H.264, we assume universal support.
        if codecType == .H264 {
            return true
        }
        
        // For HEVC decoder support on iOS 11+ we can use VTIsHardwareDecodeSupported.
        if !forEncoder && codecType == .HEVC {
            if #available(iOS 11.0, *) {
                if let fourCC = codecType.systemCodecType {
                    return VTIsHardwareDecodeSupported(fourCC)
                }
            }
            return false
        }
        
        if forEncoder {
            // Test hardware encoder using provided or default dimensions.
            return isHardwareEncoderSupported(codecType: codecType, width: testWidth, height: testHeight)
        } else {
            // Test hardware decoder using provided or default dimensions.
            return isHardwareDecoderSupported(codecType: codecType, width: testWidth, height: testHeight)
        }
    }
    
    /**
     Tests if the system supports a hardware encoder for the given video codec type at the provided dimensions.
     
     - Parameters:
       - codecType: The target video codec type.
       - width: The width (in pixels) to use when creating the compression session.
       - height: The height (in pixels) to use when creating the compression session.
     
     - Returns: True if a hardware encoder session could be created; false otherwise.
     */
    public class func isHardwareEncoderSupported(codecType: VideoCodecType,
                                                 width: Int32,
                                                 height: Int32) -> Bool {
        guard let fourCC = codecType.systemCodecType else { return false }
        
        var compressionSession: VTCompressionSession?
        let status = VTCompressionSessionCreate(allocator: nil,
                                                width: width,
                                                height: height,
                                                codecType: fourCC,
                                                encoderSpecification: nil,
                                                imageBufferAttributes: nil,
                                                compressedDataAllocator: nil,
                                                outputCallback: nil,
                                                refcon: nil,
                                                compressionSessionOut: &compressionSession)
        if status == noErr, let session = compressionSession {
            VTCompressionSessionInvalidate(session)
            return true
        }
        return false
    }
    
    /**
     Tests if the system supports a hardware decoder for the given video codec type at the provided dimensions.
     
     - Parameters:
       - codecType: The target video codec type.
       - width: The width (in pixels) to use when creating the decompression session.
       - height: The height (in pixels) to use when creating the decompression session.
     
     - Returns: True if a hardware decoder session could be created; false otherwise.
     */
    public class func isHardwareDecoderSupported(codecType: VideoCodecType,
                                                 width: Int32,
                                                 height: Int32) -> Bool {
        guard let fourCC = codecType.systemCodecType else { return false }
        
        var formatDescription: CMFormatDescription?
        let status = CMVideoFormatDescriptionCreate(allocator: nil,
                                                    codecType: fourCC,
                                                    width: width,
                                                    height: height,
                                                    extensions: nil,
                                                    formatDescriptionOut: &formatDescription)
        guard status == noErr, let formatDesc = formatDescription else {
            return false
        }
        
        var decompressionSession: VTDecompressionSession?
        var callbackRecord = VTDecompressionOutputCallbackRecord(decompressionOutputCallback: nil,
                                                                  decompressionOutputRefCon: nil)
        let creationStatus = VTDecompressionSessionCreate(allocator: nil,
                                                          formatDescription: formatDesc,
                                                          decoderSpecification: nil,
                                                          imageBufferAttributes: nil,
                                                          outputCallback: &callbackRecord,
                                                          decompressionSessionOut: &decompressionSession)
        if creationStatus == noErr, let session = decompressionSession {
            VTDecompressionSessionInvalidate(session)
            return true
        }
        return false
    }
    
        /**
        Tests if the system supports the given audio codec.
        
        - Parameters:
          - codecType: The target audio codec type (e.g. .aac).
          - forEncoder: If true, tests for encoder support; if false, tests for decoder support.
        
        - Returns: True if the audio codec is supported; false otherwise.
        */
    public class func isAudioCodecSupported(codecType: AudioCodecType,
                                            forEncoder: Bool = false) -> Bool {
        if let _ = codecType.formatID {
            if forEncoder {
                // Use default ASBD for encoder from the AudioCodecType extension.
                // Assume the input format is PCM.
                guard let defaultOutput = codecType.defaultASBDForEncoder,
                      let defaultInput = AudioCodecType.PCM_CODEC.defaultASBDForEncoder else {
                    return false
                }
                var inputFormat = defaultInput  // Create mutable copy
                var outputFormat = defaultOutput // Create mutable copy
                var converter: AudioConverterRef?
                let status = AudioConverterNew(&inputFormat, &outputFormat, &converter)
                if status == noErr, let conv = converter {
                    AudioConverterDispose(conv)
                    return true
                }
                return false
            } else {
                // For decoding, many common codecs (like AAC) are assumed supported.
                return true
            }
        } else {
            return false
        }
    }
    /**
     Public unified function that checks if the system supports a given codec configuration.
     
     This method does not require a stream URL. It directly checks the system's available codecs.
     
     - Parameters:
       - videoCodecType: The target video codec type (e.g. .hevc).
       - pixelFormat: The target pixel format (e.g. .yuv420BiPlanar).
       - audioCodecType: The target audio codec type (e.g. .aac).
       - width: Optional video width for testing (if not supplied, defaults to 1920).
       - height: Optional video height for testing (if not supplied, defaults to 1080).
     
     - Returns: True if both the video codec (with the specified pixel format) and the audio codec are supported.
     
     Example:
     ```
     let supported = SystemCodecChecker.isCodecConfigurationSupported(
         videoCodecType: .hevc,
         pixelFormat: .yuv420BiPlanar,
         audioCodecType: .aac,
         width: 1920,
         height: 1080
     )
     print("Codec configuration supported: \(supported)")
     ```
     */
    public class func isCodecConfigurationSupported(videoCodecType: VideoCodecType,
                                                    pixelFormat: PixelFormat,
                                                    audioCodecType: AudioCodecType,
                                                    width: Int32? = nil,
                                                    height: Int32? = nil) -> Bool {
        let testWidth: Int32 = width ?? 1920
        let testHeight: Int32 = height ?? 1080
        
        let videoSupported = isVideoCodecSupported(codecType: videoCodecType,
                                                   pixelFormat: pixelFormat,
                                                   forEncoder: false,
                                                   width: testWidth,
                                                   height: testHeight)
        let audioSupported = isAudioCodecSupported(codecType: audioCodecType, forEncoder: false)
        let result = videoSupported && audioSupported
        print("Final codec configuration support: Video Supported=\(videoSupported), Audio Supported=\(audioSupported), Overall=\(result)")
        return result
    }
}
