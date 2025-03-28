import SystemCodecChecker from './NativeSystemCodecChecker';
import { VideoCodecType } from './VideoCodecTypes';
import { AudioCodecType } from './AudioCodecTypes';
import { PixelFormat } from './PixelFormat';

export * from './AudioCodecTypes';
export * from './VideoCodecTypes';
export * from './PixelFormat';

export function isVideoCodecSupported(
  videoCodecType: VideoCodecType,
  pixelFormat: PixelFormat,
  forEncoder: boolean
): boolean {
  // The enum values are strings so they work directly with the native bridge.
  return SystemCodecChecker.isVideoCodecSupported(
    videoCodecType,
    pixelFormat,
    forEncoder
  );
}

export function isAudioCodecSupported(
  audioCodecType: AudioCodecType,
  forEncoder: boolean
): boolean {
  return SystemCodecChecker.isAudioCodecSupported(audioCodecType, forEncoder);
}

export function isCodecConfigurationSupported(
  videoCodecType: VideoCodecType,
  pixelFormat: PixelFormat,
  audioCodecType: AudioCodecType
): boolean {
  return SystemCodecChecker.isCodecConfigurationSupported(
    videoCodecType,
    pixelFormat,
    audioCodecType
  );
}
