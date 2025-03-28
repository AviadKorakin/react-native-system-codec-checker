# react-native-system-codec-checker

Checks if your system has the requirement to encode/decode based on encoder decoder hardware

## Installation

```sh
npm install react-native-system-codec-checker
```

## Usage

<<<<<<< HEAD

```js
import { multiply } from 'react-native-system-codec-checker';

// ...

const result = multiply(3, 7);
```


=======
```js
import { Text, ScrollView, StyleSheet, Platform } from 'react-native';
import {
  isVideoCodecSupported,
  isAudioCodecSupported,
  isCodecConfigurationSupported,
  AudioCodecType,
  VideoCodecType,
  PixelFormat,
} from 'react-native-system-codec-checker';

// Basic simulator check. For a robust check consider using a library like react-native-device-info.
const isSimulator =
  Platform.OS === 'ios' && !!process.env.SIMULATOR_DEVICE_NAME;

export default function App() {
  // HEVC is generally not supported on the iOS Simulator.
  const hevcVideoSupported = isVideoCodecSupported(
    VideoCodecType.HEVC,
    PixelFormat.COLOR_FormatYUV420Flexible,
    false
  );

  // H264 is widely supported (both on device and simulator).
  const h264VideoSupported = isVideoCodecSupported(
    VideoCodecType.H264,
    PixelFormat.COLOR_FormatYUV420Flexible,
    false
  );

  // AAC audio should be supported.
  const aacAudioSupported = isAudioCodecSupported(AudioCodecType.AAC, false);

  // Codec configuration tests:
  // HEVC + AAC: On a simulator, this should report as not supported.
  const hevcAacConfig = isCodecConfigurationSupported(
    VideoCodecType.HEVC,
    PixelFormat.COLOR_FormatYUV420Flexible,
    AudioCodecType.AAC
  );

  // H264 + AAC: This configuration is expected to be supported.
  const h264AacConfig = isAudioCodecSupported(AudioCodecType.AAC, false);

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.text}>
        HEVC Video Support:{' '}
        {Platform.OS === 'ios' && isSimulator
          ? 'Not Supported (Simulator)'
          : hevcVideoSupported
            ? 'Supported'
            : 'Not Supported'}
      </Text>
      <Text style={styles.text}>
        H264 Video Support: {h264VideoSupported ? 'Supported' : 'Not Supported'}
      </Text>
      <Text style={styles.text}>
        AAC Audio Support: {aacAudioSupported ? 'Supported' : 'Not Supported'}
      </Text>
      <Text style={styles.text}>
        Codec Config (HEVC + AAC):{' '}
        {Platform.OS === 'ios' && isSimulator
          ? 'Not Supported (Simulator)'
          : hevcAacConfig
            ? 'Supported'
            : 'Not Supported'}
      </Text>
      <Text style={styles.text}>
        Codec Config (H264 + AAC):{' '}
        {h264AacConfig ? 'Supported' : 'Not Supported'}
      </Text>
      {Platform.OS === 'ios' && (
        <Text style={styles.text}>
          Running on {isSimulator ? 'iOS Simulator' : 'iOS Device'}
        </Text>
      )}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: 20,
  },
  text: {
    fontSize: 16,
    marginVertical: 8,
  },
});
```

>>>>>>> 9c2d40d (chore: update readme.me)
## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
