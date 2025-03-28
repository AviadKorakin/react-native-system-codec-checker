//
//  PixelFormat.swift
//  react-native-codec-check-ios
//
//  Created by Aviad on 28/03/2025.
//

import Foundation

public enum PixelFormat: Int {
    // Legacy / Basic Formats
    case COLOR_FormatMonochrome = 1
    case COLOR_Format8bitRGB332 = 2
    case COLOR_Format12bitRGB444 = 3
    case COLOR_Format16bitARGB4444 = 4
    case COLOR_Format16bitARGB1555 = 5
    case COLOR_Format16bitRGB565 = 6
    case COLOR_Format16bitBGR565 = 7
    case COLOR_Format18bitRGB666 = 8
    case COLOR_Format18bitARGB1665 = 9
    case COLOR_Format19bitARGB1666 = 10
    case COLOR_Format24bitRGB888 = 11
    case COLOR_Format24bitBGR888 = 12
    case COLOR_Format24bitARGB1887 = 13
    case COLOR_Format25bitARGB1888 = 14
    case COLOR_Format32bitBGRA8888 = 15
    case COLOR_Format32bitARGB8888 = 16

    // YUV Formats (Deprecated variants – use flexible versions instead)
    case COLOR_FormatYUV411Planar = 17
    case COLOR_FormatYUV411PackedPlanar = 18
    case COLOR_FormatYUV420Planar = 19
    case COLOR_FormatYUV420PackedPlanar = 20
    case COLOR_FormatYUV420SemiPlanar = 21
    case COLOR_FormatYUV422Planar = 22
    case COLOR_FormatYUV422PackedPlanar = 23
    case COLOR_FormatYUV422SemiPlanar = 24
    case COLOR_FormatYCbYCr = 25
    case COLOR_FormatYCrYCb = 26
    case COLOR_FormatCbYCrY = 27
    case COLOR_FormatCrYCbY = 28
    case COLOR_FormatYUV444Interleaved = 29

    // Bayer Formats
    case COLOR_FormatRawBayer8bit = 30
    case COLOR_FormatRawBayer10bit = 31
    case COLOR_FormatRawBayer8bitcompressed = 32

    // Luminance Formats
    case COLOR_FormatL2 = 33
    case COLOR_FormatL4 = 34
    case COLOR_FormatL8 = 35
    case COLOR_FormatL16 = 36
    case COLOR_FormatL24 = 37
    case COLOR_FormatL32 = 38

    // Additional YUV Packed Formats (Deprecated)
    case COLOR_FormatYUV420PackedSemiPlanar = 39
    case COLOR_FormatYUV422PackedSemiPlanar = 40
    case COLOR_Format18BitBGR666 = 41
    case COLOR_Format24BitARGB6666 = 42
    case COLOR_Format24BitABGR6666 = 43

    // Vendor-specific / Flexible Formats
    case colorTIFormatYUV420PackedSemiPlanar = 2130706688
    case COLOR_FormatSurface = 2130708361
    case COLOR_Format32bitABGR8888 = 2130747392
    case COLOR_FormatYUV420Flexible = 2135033992
    case COLOR_FormatYUV422Flexible = 2135042184
    case COLOR_FormatYUV444Flexible = 2135181448
    case COLOR_FormatRGBFlexible = 2134292616
    case COLOR_FormatRGBAFlexible = 2134288520
    case colorQCOMFormatYUV420SemiPlanar = 2141391872
    case COLOR_FormatYUV420BiPlanarVideoRange = 875704438  // '420v' -> kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange
    case COLOR_FormatYUV420BiPlanarFullRange  = 875704422  // '420f' -> kCVPixelFormatType_420YpCbCr8BiPlanarFullRange


    /// Computed property to get a description for each pixel format.
    public var description: String {
        switch self {
        case .COLOR_FormatMonochrome: return "8-bit grayscale (Y plane only)"
        case .COLOR_Format8bitRGB332: return "8-bit RGB (3-3-2 bits per channel)"
        case .COLOR_Format12bitRGB444: return "12-bit RGB (4-4-4 bits)"
        case .COLOR_Format16bitARGB4444: return "16-bit ARGB (4-4-4-4 bits per channel)"
        case .COLOR_Format16bitARGB1555: return "16-bit ARGB (1-bit alpha, 5-5-5 RGB)"
        case .COLOR_Format16bitRGB565: return "16-bit RGB (5-6-5 bits). Common RGB565 format"
        case .COLOR_Format16bitBGR565: return "16-bit BGR (5-6-5). Deprecated in favor of RGB565"
        case .COLOR_Format18bitRGB666: return "18-bit RGB (6-6-6). Deprecated"
        case .COLOR_Format18bitARGB1665: return "18-bit ARGB (1-6-6-5). Deprecated"
        case .COLOR_Format19bitARGB1666: return "19-bit ARGB (1-6-6-6). Deprecated"
        case .COLOR_Format24bitRGB888: return "24-bit RGB (8-8-8). Deprecated; use 24-bit BGR888 or flexible RGB"
        case .COLOR_Format24bitBGR888: return "24-bit BGR (8-8-8). Little-endian RGB_888 (B, G, R)"
        case .COLOR_Format24bitARGB1887: return "24-bit ARGB (1-8-8-7). Deprecated"
        case .COLOR_Format25bitARGB1888: return "25-bit ARGB (1-8-8-8). Deprecated"
        case .COLOR_Format32bitBGRA8888: return "32-bit BGRA (8 bits each). Deprecated; use 32-bit ABGR8888 or RGBA flexible"
        case .COLOR_Format32bitARGB8888: return "32-bit ARGB (8 bits each). Deprecated; use 32-bit ABGR8888 or RGBA flexible"
        case .COLOR_FormatYUV411Planar: return "YUV 4:1:1 planar. Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV411PackedPlanar: return "YUV 4:1:1 packed planar. Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV420Planar: return "YUV 4:2:0 planar (I420). Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV420PackedPlanar: return "YUV 4:2:0 packed planar. Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV420SemiPlanar: return "YUV 4:2:0 semi-planar (NV12/NV21). Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV422Planar: return "YUV 4:2:2 planar. Deprecated; use YUV422Flexible"
        case .COLOR_FormatYUV422PackedPlanar: return "YUV 4:2:2 packed planar. Deprecated; use YUV422Flexible"
        case .COLOR_FormatYUV422SemiPlanar: return "YUV 4:2:2 semi-planar. Deprecated; use YUV422Flexible"
        case .COLOR_FormatYCbYCr: return "YUV 4:2:2 interleaved (YUY2). Deprecated; use YUV422Flexible"
        case .COLOR_FormatYCrYCb: return "YUV 4:2:2 interleaved (YVY2). Deprecated"
        case .COLOR_FormatCbYCrY: return "YUV 4:2:2 interleaved (UYVY). Deprecated"
        case .COLOR_FormatCrYCbY: return "YUV 4:2:2 interleaved (VYUY). Deprecated"
        case .COLOR_FormatYUV444Interleaved: return "YUV 4:4:4 interleaved. Deprecated; use YUV444Flexible"
        case .COLOR_FormatRawBayer8bit: return "8-bit Bayer raw (sensor pixel data)"
        case .COLOR_FormatRawBayer10bit: return "10-bit Bayer raw (sensor pixel data)"
        case .COLOR_FormatRawBayer8bitcompressed: return "8-bit compressed Bayer (per SMIA spec)"
        case .COLOR_FormatL2: return "2-bit luminance. Deprecated; use L8"
        case .COLOR_FormatL4: return "4-bit luminance. Deprecated; use L8"
        case .COLOR_FormatL8: return "8-bit luminance (monochrome)"
        case .COLOR_FormatL16: return "16-bit luminance (little-endian)"
        case .COLOR_FormatL24: return "24-bit luminance. Deprecated; use L16"
        case .COLOR_FormatL32: return "32-bit luminance. Deprecated; use L16"
        case .COLOR_FormatYUV420PackedSemiPlanar: return "YUV 4:2:0 packed semi-planar. Deprecated; use YUV420Flexible"
        case .COLOR_FormatYUV422PackedSemiPlanar: return "YUV 4:2:2 packed semi-planar. Deprecated; use YUV422Flexible"
        case .COLOR_Format18BitBGR666: return "18-bit BGR (6-6-6). Deprecated; use 24-bit BGR888"
        case .COLOR_Format24BitARGB6666: return "24-bit ARGB (6-6-6-6). Deprecated; use 32-bit ABGR8888"
        case .COLOR_Format24BitABGR6666: return "24-bit ABGR (6-6-6-6). Deprecated; use 32-bit ABGR8888"
        case .colorTIFormatYUV420PackedSemiPlanar: return "TI-specific YUV 4:2:0 packed semi-planar format"
        case .COLOR_FormatSurface: return "Android opaque surface format (GPU GraphicBuffer handle)"
        case .COLOR_Format32bitABGR8888: return "32-bit ABGR (corresponds to standard RGBA_8888 pixel format)"
        case .COLOR_FormatYUV420Flexible: return "Flexible YUV 4:2:0 format (corresponds to ImageFormat.YUV_420_888)"
        case .COLOR_FormatYUV422Flexible: return "Flexible YUV 4:2:2 format (corresponds to ImageFormat.YUV_422_888)"
        case .COLOR_FormatYUV444Flexible: return "Flexible YUV 4:4:4 format (corresponds to ImageFormat.YUV_444_888)"
        case .COLOR_FormatRGBFlexible: return "Flexible RGB format (24-bit, corresponds to ImageFormat.FLEX_RGB_888)"
        case .COLOR_FormatRGBAFlexible: return "Flexible RGBA format (32-bit, corresponds to ImageFormat.FLEX_RGBA_8888)"
        case .colorQCOMFormatYUV420SemiPlanar: return "QCOM-specific YUV 4:2:0 semi-planar format"
        case .COLOR_FormatYUV420BiPlanarVideoRange:
            return "YUV 4:2:0 Bi-Planar (Video Range) - kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange ('420v')"
        case .COLOR_FormatYUV420BiPlanarFullRange:
            return "YUV 4:2:0 Bi-Planar (Full Range) - kCVPixelFormatType_420YpCbCr8BiPlanarFullRange ('420f')"
        }
    }

    /// Computed property indicating whether this pixel format is deprecated.
    public var isDeprecated: Bool {
        switch self {
        case .COLOR_Format16bitBGR565, .COLOR_Format18bitRGB666, .COLOR_Format18bitARGB1665, .COLOR_Format19bitARGB1666,
             .COLOR_Format24bitRGB888, .COLOR_Format24bitARGB1887, .COLOR_Format25bitARGB1888, .COLOR_Format32bitBGRA8888,
             .COLOR_Format32bitARGB8888, .COLOR_FormatYUV411Planar, .COLOR_FormatYUV411PackedPlanar, .COLOR_FormatYUV420Planar,
             .COLOR_FormatYUV420PackedPlanar, .COLOR_FormatYUV420SemiPlanar, .COLOR_FormatYUV422Planar,
             .COLOR_FormatYUV422PackedPlanar, .COLOR_FormatYUV422SemiPlanar, .COLOR_FormatYCbYCr, .COLOR_FormatYCrYCb,
             .COLOR_FormatCbYCrY, .COLOR_FormatCrYCbY, .COLOR_FormatYUV444Interleaved,
             .COLOR_FormatL2, .COLOR_FormatL4, .COLOR_FormatL24, .COLOR_FormatL32,
             .COLOR_FormatYUV420PackedSemiPlanar, .COLOR_FormatYUV422PackedSemiPlanar,
             .COLOR_Format18BitBGR666, .COLOR_Format24BitARGB6666, .COLOR_Format24BitABGR6666,.COLOR_FormatYUV420BiPlanarVideoRange,.COLOR_FormatYUV420BiPlanarFullRange:
            return true
        default:
            return false
        }
    }
}

