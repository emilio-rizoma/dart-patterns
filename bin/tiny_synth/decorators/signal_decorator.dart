import '../components/signal.dart';

abstract class SignalDecorator extends Signal {
  final Signal signal;

  SignalDecorator(this.signal);

  Signal getSignal();
}
