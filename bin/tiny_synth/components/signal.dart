abstract class Signal {
  int sampleRate = 44100;
  int bitDepth = 16;
  int channels = 1;
  int frames = 1024;

  int getSampleRate() => sampleRate;
  int getBitDepth() => bitDepth;
  int getChannles() => channels;
  int getFrames() => frames;

  void play();
  void stop();
}
