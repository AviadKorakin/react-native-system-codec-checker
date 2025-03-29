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
  forEncoder: boolean,
  width: number = 1920,
  height: number = 1080
): boolean {
  return SystemCodecChecker.isVideoCodecSupported(
    videoCodecType,
    pixelFormat,
    forEncoder,
    width,
    height
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
  audioCodecType: AudioCodecType,
  width: number = 1920,
  height: number = 1080
): boolean {
  return SystemCodecChecker.isCodecConfigurationSupported(
    videoCodecType,
    pixelFormat,
    audioCodecType,
    width,
    height
  );
}
