package com.systemcodecchecker.enums

enum class VideoCodecType(val mimeType: String) {
    h263("video/3gpp"), // H.263 (typically used in 3GP files)
    mpeg4("video/mp4v-es"), // MPEG-4 Part 2 (Simple/Advanced Profile)
    H264("video/avc"), // H.264/AVC (widely supported for both encode/decode)
    HEVC("video/hevc"), // H.265/HEVC (supported on newer devices; encoding may be limited)
    VP8("video/x-vnd.on2.vp8"), // VP8 (common in WebM)
    VP9("video/x-vnd.on2.vp9"), // VP9 (increasingly available especially for decoding)
    AV1("video/av01"), // AV1 (emerging codec; available on Android 10+/14+)
    MPEG2("video/mpeg2"), // MPEG-2 (typically found on Android TV devices; mostly decoding)
    DOLBY_VISION("video/dolby-vision") // Dolby Vision (plays on select licensed devices)
}
