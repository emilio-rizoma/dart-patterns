import 'package:rxdart/rxdart.dart';

/// Singleton Generic Service
///
/// Accepts any type of data and can pass it back
/// to any of the subcribed widgets.
abstract class GenericService<T> {
  /// The generic BehavirSubject that controls the stream.
  final ReplaySubject<T> _generic;

  GenericService(this._generic);

  /// The stream of the singleton
  Stream<T?> get stream$ => _generic.stream;

  /// The current value of the stream
  List<T> get list => _generic.values;

  T get last => list.last;
  T get first => list.first;

  /// A function responsible of adding an element to the stream
  void add(Function(List<T>) f) {
    if (_generic.isClosed) {
      return print('Sorry the stream is closed!');
    }
    _generic.add(f(list));
  }

  void close() {
    !_generic.isClosed
        ? {_generic.close(), print('The stream is closing...')}
        : print('The stream is closed!');
  }
}

class User {
  String name;
  User(this.name);
}

class UserService extends GenericService<User> {
  UserService(ReplaySubject<User> generic) : super(generic);
}
