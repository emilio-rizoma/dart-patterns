import 'signal.dart';

class Sine extends Signal {
  int freq = 432;
  double amp = 0.75;

  Sine(this.freq, this.amp);

  @override
  int getBitDepth() {
    return bitDepth;
  }

  @override
  int getChannles() {
    return channels;
  }

  @override
  int getFrames() {
    return frames;
  }

  @override
  int getSampleRate() {
    return sampleRate;
  }

  @override
  void play() => 'Sine playing...';

  @override
  void stop() => 'Sine stoped';
}
