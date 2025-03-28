import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  isVideoCodecSupported(
    videoCodecType: string,
    pixelFormat: string,
    forEncoder: boolean
  ): boolean;
  isAudioCodecSupported(audioCodecType: string, forEncoder: boolean): boolean;
  isCodecConfigurationSupported(
    videoCodecType: string,
    pixelFormat: string,
    audioCodecType: string
  ): boolean;
}

export default TurboModuleRegistry.getEnforcing<Spec>('SystemCodecChecker');
