package com.systemcodecchecker.enums

enum class PixelFormat(
        val formatValue: Int,
        val description: String,
        val deprecated: Boolean = false
) {
        // Legacy / Basic Formats
        COLOR_FormatMonochrome(1, "8-bit grayscale (Y plane only)"),
        COLOR_Format8bitRGB332(2, "8-bit RGB (3-3-2 bits per channel)"),
        COLOR_Format12bitRGB444(3, "12-bit RGB (4-4-4 bits)"),
        COLOR_Format16bitARGB4444(4, "16-bit ARGB (4-4-4-4 bits per channel)"),
        COLOR_Format16bitARGB1555(5, "16-bit ARGB (1-bit alpha, 5-5-5 RGB)"),
        COLOR_Format16bitRGB565(6, "16-bit RGB (5-6-5 bits). Common RGB565 format"),
        COLOR_Format16bitBGR565(7, "16-bit BGR (5-6-5). Deprecated in favor of RGB565", true),
        COLOR_Format18bitRGB666(8, "18-bit RGB (6-6-6). Deprecated", true),
        COLOR_Format18bitARGB1665(9, "18-bit ARGB (1-6-6-5). Deprecated", true),
        COLOR_Format19bitARGB1666(10, "19-bit ARGB (1-6-6-6). Deprecated", true),
        COLOR_Format24bitRGB888(
                11,
                "24-bit RGB (8-8-8). Deprecated; use 24-bit BGR888 or flexible RGB",
                true
        ),
        COLOR_Format24bitBGR888(12, "24-bit BGR (8-8-8). Little-endian RGB_888 (B, G, R)"),
        COLOR_Format24bitARGB1887(13, "24-bit ARGB (1-8-8-7). Deprecated", true),
        COLOR_Format25bitARGB1888(14, "25-bit ARGB (1-8-8-8). Deprecated", true),
        COLOR_Format32bitBGRA8888(
                15,
                "32-bit BGRA (8 bits each). Deprecated; use 32bit ABGR8888 or RGBA flexible",
                true
        ),
        COLOR_Format32bitARGB8888(
                16,
                "32-bit ARGB (8 bits each). Deprecated; use 32bit ABGR8888 or RGBA flexible",
                true
        ),

        // YUV Formats (Deprecated variants – use flexible versions instead)
        COLOR_FormatYUV411Planar(17, "YUV 4:1:1 planar. Deprecated; use YUV420Flexible", true),
        COLOR_FormatYUV411PackedPlanar(
                18,
                "YUV 4:1:1 packed planar. Deprecated; use YUV420Flexible",
                true
        ),
        COLOR_FormatYUV420Planar(
                19,
                "YUV 4:2:0 planar (I420). Deprecated; use YUV420Flexible",
                true
        ),
        COLOR_FormatYUV420PackedPlanar(
                20,
                "YUV 4:2:0 packed planar. Deprecated; use YUV420Flexible",
                true
        ),
        COLOR_FormatYUV420SemiPlanar(
                21,
                "YUV 4:2:0 semi-planar (NV12/NV21). Deprecated; use YUV420Flexible",
                true
        ),
        COLOR_FormatYUV422Planar(22, "YUV 4:2:2 planar. Deprecated; use YUV422Flexible", true),
        COLOR_FormatYUV422PackedPlanar(
                23,
                "YUV 4:2:2 packed planar. Deprecated; use YUV422Flexible",
                true
        ),
        COLOR_FormatYUV422SemiPlanar(
                24,
                "YUV 4:2:2 semi-planar. Deprecated; use YUV422Flexible",
                true
        ),
        COLOR_FormatYCbYCr(
                25,
                "YUV 4:2:2 interleaved (YUY2). Deprecated; use YUV422Flexible",
                true
        ),
        COLOR_FormatYCrYCb(26, "YUV 4:2:2 interleaved (YVY2). Deprecated", true),
        COLOR_FormatCbYCrY(27, "YUV 4:2:2 interleaved (UYVY). Deprecated", true),
        COLOR_FormatCrYCbY(28, "YUV 4:2:2 interleaved (VYUY). Deprecated", true),
        COLOR_FormatYUV444Interleaved(
                29,
                "YUV 4:4:4 interleaved. Deprecated; use YUV444Flexible",
                true
        ),

        // Bayer Formats
        COLOR_FormatRawBayer8bit(30, "8-bit Bayer raw (sensor pixel data)"),
        COLOR_FormatRawBayer10bit(31, "10-bit Bayer raw (sensor pixel data)"),
        COLOR_FormatRawBayer8bitcompressed(32, "8-bit compressed Bayer (per SMIA spec)"),

        // Luminance Formats
        COLOR_FormatL2(33, "2-bit luminance. Deprecated; use L8", true),
        COLOR_FormatL4(34, "4-bit luminance. Deprecated; use L8", true),
        COLOR_FormatL8(35, "8-bit luminance (monochrome)"),
        COLOR_FormatL16(36, "16-bit luminance (little-endian)"),
        COLOR_FormatL24(37, "24-bit luminance. Deprecated; use L16", true),
        COLOR_FormatL32(38, "32-bit luminance. Deprecated; use L16", true),

        // Additional YUV Packed Formats (Deprecated)
        COLOR_FormatYUV420PackedSemiPlanar(
                39,
                "YUV 4:2:0 packed semi-planar. Deprecated; use YUV420Flexible",
                true
        ),
        COLOR_FormatYUV422PackedSemiPlanar(
                40,
                "YUV 4:2:2 packed semi-planar. Deprecated; use YUV422Flexible",
                true
        ),
        COLOR_Format18BitBGR666(41, "18-bit BGR (6-6-6). Deprecated; use 24-bit BGR888", true),
        COLOR_Format24BitARGB6666(
                42,
                "24-bit ARGB (6-6-6-6). Deprecated; use 32-bit ABGR8888",
                true
        ),
        COLOR_Format24BitABGR6666(
                43,
                "24-bit ABGR (6-6-6-6). Deprecated; use 32-bit ABGR8888",
                true
        ),

        // Vendor-specific / Flexible Formats
        COLOR_TI_FormatYUV420PackedSemiPlanar(
                2130706688,
                "TI-specific YUV 4:2:0 packed semi-planar format"
        ),
        COLOR_FormatSurface(2130708361, "Android opaque surface format (GPU GraphicBuffer handle)"),
        COLOR_Format32bitABGR8888(
                2130747392,
                "32-bit ABGR (corresponds to standard RGBA_8888 pixel format)"
        ),
        COLOR_FormatYUV420Flexible(
                2135033992,
                "Flexible YUV 4:2:0 format (corresponds to ImageFormat.YUV_420_888)"
        ),
        COLOR_FormatYUV422Flexible(
                2135042184,
                "Flexible YUV 4:2:2 format (corresponds to ImageFormat.YUV_422_888)"
        ),
        COLOR_FormatYUV444Flexible(
                2135181448,
                "Flexible YUV 4:4:4 format (corresponds to ImageFormat.YUV_444_888)"
        ),
        COLOR_FormatRGBFlexible(
                2134292616,
                "Flexible RGB format (24-bit, corresponds to ImageFormat.FLEX_RGB_888)"
        ),
        COLOR_FormatRGBAFlexible(
                2134288520,
                "Flexible RGBA format (32-bit, corresponds to ImageFormat.FLEX_RGBA_8888)"
        ),
        COLOR_QCOM_FormatYUV420SemiPlanar(2141391872, "QCOM-specific YUV 4:2:0 semi-planar format")
}
