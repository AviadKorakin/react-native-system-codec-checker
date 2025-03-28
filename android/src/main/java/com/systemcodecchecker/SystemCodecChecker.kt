package com.systemcodecchecker

import android.media.MediaCodecInfo
import android.media.MediaCodecList
import android.util.Log
import com.systemcodecchecker.enums.AudioCodecType
import com.systemcodecchecker.enums.PixelFormat
import com.systemcodecchecker.enums.VideoCodecType

object SystemCodecChecker {
    private const val TAG = "SystemCodecChecker"

    /**
     * Tests if the system supports the given video codec with the specified pixel format.
     *
     * @param codecType The target video codec type (enum value, e.g. VideoCodecType.HEVC).
     * @param pixelFormat The target pixel format (enum value, e.g.
     * PixelFormat.COLOR_FormatYUV420Flexible).
     * @param forEncoder If true, tests for encoder support; if false, tests for decoder support.
     * @return true if a matching codec is found, false otherwise.
     */
    fun isVideoCodecSupported(
            codecType: VideoCodecType,
            pixelFormat: PixelFormat,
            forEncoder: Boolean = false
    ): Boolean {
        val codecList = MediaCodecList(MediaCodecList.ALL_CODECS)
        for (info in codecList.codecInfos) {
            if (info.isEncoder != forEncoder) continue
            for (type in info.supportedTypes) {
                if (type.equals(codecType.mimeType, ignoreCase = true)) {
                    val capabilities: MediaCodecInfo.CodecCapabilities =
                            info.getCapabilitiesForType(type)
                    if (capabilities.colorFormats.contains(pixelFormat.formatValue)) {
                        Log.d(
                                TAG,
                                "Video codec supported: ${info.name} supports ${codecType.name} with pixel format ${pixelFormat.name}"
                        )
                        return true
                    }
                }
            }
        }
        Log.d(
                TAG,
                "Video codec ${codecType.name} with pixel format ${pixelFormat.name} is NOT supported for ${if (forEncoder) "encoding" else "decoding"}."
        )
        return false
    }

    /**
     * Tests if the system supports the given audio codec.
     *
     * @param codecType The target audio codec type (enum value, e.g. AudioCodecType.AAC).
     * @param forEncoder If true, tests for encoder support; if false, tests for decoder support.
     * @return true if a matching audio codec is found, false otherwise.
     */
    fun isAudioCodecSupported(codecType: AudioCodecType, forEncoder: Boolean = false): Boolean {
        val codecList = MediaCodecList(MediaCodecList.ALL_CODECS)
        for (info in codecList.codecInfos) {
            if (info.isEncoder != forEncoder) continue
            for (type in info.supportedTypes) {
                if (type.equals(codecType.mimeType, ignoreCase = true)) {
                    Log.d(TAG, "Audio codec supported: ${info.name} supports ${codecType.name}")
                    return true
                }
            }
        }
        Log.d(
                TAG,
                "Audio codec ${codecType.name} is NOT supported for ${if (forEncoder) "encoding" else "decoding"}."
        )
        return false
    }

    /**
     * Public unified function that checks if the system supports a given codec configuration.
     *
     * This method does not require a stream URL. It directly checks the system's available codecs.
     *
     * @param videoCodecType The target video codec type (e.g. VideoCodecType.HEVC).
     * @param pixelFormat The target pixel format for video (e.g.
     * PixelFormat.COLOR_FormatYUV420Flexible).
     * @param audioCodecType The target audio codec type (e.g. AudioCodecType.AAC).
     * @return true if the system supports both the video codec (with the specified pixel format)
     * and the audio codec, false otherwise.
     *
     * Example:
     * ```
     * val supported = SystemCodecChecker.isCodecConfigurationSupported(
     *     VideoCodecType.HEVC,
     *     PixelFormat.COLOR_FormatYUV420Flexible,
     *     AudioCodecType.AAC
     * )
     * Log.d(TAG, "Codec configuration supported: $supported")
     * ```
     */
    fun isCodecConfigurationSupported(
            videoCodecType: VideoCodecType,
            pixelFormat: PixelFormat,
            audioCodecType: AudioCodecType
    ): Boolean {
        val videoSupported = isVideoCodecSupported(videoCodecType, pixelFormat, forEncoder = false)
        val audioSupported = isAudioCodecSupported(audioCodecType, forEncoder = false)
        val result = videoSupported && audioSupported
        Log.d(
                TAG,
                "Final codec configuration support: Video Supported=$videoSupported, Audio Supported=$audioSupported, Overall=$result"
        )
        return result
    }
}
