package com.systemcodecchecker

// Update enum imports to the new package if you have renamed them:
// Import your business logic class (make sure its package is correct)
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.annotations.ReactModule
import com.systemcodecchecker.enums.AudioCodecType
import com.systemcodecchecker.enums.PixelFormat
import com.systemcodecchecker.enums.VideoCodecType

// Note: This is the generated spec name. If codegen generated a different class name,
// use that instead.
@ReactModule(name = SystemCodecCheckerModule.NAME)
class SystemCodecCheckerModule(reactContext: ReactApplicationContext) :
        NativeSystemCodecCheckerSpec(reactContext) {

  override fun getName(): String {
    return NAME
  }

  override fun isVideoCodecSupported(
    videoCodecType: String?,
    pixelFormat: String?,
    forEncoder: Boolean,
    width: Double?,
    height: Double?
  ): Boolean {
    return try {
      val videoEnum = VideoCodecType.valueOf(videoCodecType.toString())
      val pixelEnum = PixelFormat.valueOf(pixelFormat.toString())
      SystemCodecChecker.isVideoCodecSupported(videoEnum, pixelEnum, forEncoder)
    } catch (e: Exception) {
      false
    }
  }

  override fun isAudioCodecSupported(audioCodecType: String, forEncoder: Boolean): Boolean {
    return try {
      val audioEnum = AudioCodecType.valueOf(audioCodecType)
      SystemCodecChecker.isAudioCodecSupported(audioEnum, forEncoder)
    } catch (e: Exception) {
      false
    }
  }

  override fun isCodecConfigurationSupported(
    videoCodecType: String?,
    pixelFormat: String?,
    audioCodecType: String?,
    width: Double?,
    height: Double?
  ): Boolean {
    return try {
      val videoEnum = VideoCodecType.valueOf(videoCodecType.toString())
      val pixelEnum = PixelFormat.valueOf(pixelFormat.toString())
      val audioEnum = AudioCodecType.valueOf(audioCodecType.toString())
      SystemCodecChecker.isCodecConfigurationSupported(videoEnum, pixelEnum, audioEnum)
    } catch (e: Exception) {
      false
    }
  }

  companion object {
    const val NAME = "SystemCodecChecker"
  }
}
