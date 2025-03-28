package com.systemcodecchecker.enums

enum class AudioCodecType(val mimeType: String) {
    AAC("audio/mp4a-latm"), // Advanced Audio Coding (AAC)
    AC3("audio/ac3"), // Dolby Digital (AC-3)
    E_AC3("audio/eac3"), // Enhanced AC-3 (E-AC-3)
    DTS("audio/vnd.dts"), // DTS Digital Theater Systems
    DTS_HD("audio/vnd.dts.hd"), // DTS-HD High Resolution Audio
    TRUE_HD("audio/true-hd"), // Dolby TrueHD
    OPUS("audio/opus"), // Opus codec
    VORBIS("audio/vorbis"), // Vorbis codec
    FLAC("audio/flac"), // Free Lossless Audio Codec (FLAC)
    MP3("audio/mpeg"), // MPEG audio (MP3)
    PCM("audio/raw"), // Uncompressed PCM audio
    AMR_NB("audio/amr-nb"), // Adaptive Multi-Rate Narrowband
    AMR_WB("audio/amr-wb"), // Adaptive Multi-Rate Wideband
    MPEG_H("audio/mpegh") // MPEG-H 3D Audio (for immersive audio experiences)
}
