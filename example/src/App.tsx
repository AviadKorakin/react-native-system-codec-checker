import { View, Text, StyleSheet } from 'react-native';
import Video from 'react-native-video';
import {
  isVideoCodecSupported,
  VideoCodecType,
  PixelFormat,
} from 'react-native-system-codec-checker';

const App = () => {
  // Define video sources
  const h264Video = require('../videos/H264.mp4');
  const hevcVideo = require('../videos/HVEC.mp4');

  // Check for HEVC support
  const hevcSupported = isVideoCodecSupported(
    VideoCodecType.HEVC,
    PixelFormat.COLOR_FormatYUV420Flexible,
    false,
    1920,
    1080
  );

  // Select video source based on support
  const selectedVideo = hevcSupported ? hevcVideo : h264Video;

  return (
    <View style={styles.container}>
      <Text style={styles.text}>
        {hevcSupported ? 'Playing HEVC (H.265) Video' : 'Playing H.264 Video'}
      </Text>
      <Video
        source={selectedVideo}
        style={styles.video}
        controls={true}
        resizeMode="contain"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 18,
    marginBottom: 10,
  },
  video: {
    width: '100%',
    height: 300,
  },
});

export default App;
