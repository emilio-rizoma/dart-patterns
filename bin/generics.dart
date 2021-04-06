import 'package:rxdart/rxdart.dart';
// import 'decorator.dart';
import 'singelton.dart';

void main(List<String> arguments) {
  singleton();
}

/// This method run some tests over the Singleton Generic Service
void singleton() {
  final myBS = ReplaySubject<User>();
  final userService = UserService(myBS);

  /// This call adds a new value to the stream.
  userService.add((x) => User('Lao'));

  /// Subscription to the stream.
  userService.stream$.listen((events) {
    if (events == null) {
      return print("Sorry I'm null!");
    }
    print(userService.list.map((e) => e.name));
  });

  /// Adds a 3 second delay to the first batch of calls
  Future.delayed(
      const Duration(seconds: 3),
      () => {
            userService.add((x) => User('Man')),
            userService.add((x) => User('Ju')),

            /// Adds a 1 second delay to the second batch of instructions
            Future.delayed(
                const Duration(seconds: 1),
                () => {
                      userService.last.name = 'Eliot',
                      userService.add((x) => User('An')),

                      /// Adds a 1 second delay to the third batch of instructions
                      Future.delayed(
                          const Duration(seconds: 1),
                          () => {
                                userService.close(),
                                userService.add((x) => User('Ral'))
                              })
                    })
          });
}

// void triangle() {
//   final triangle = Triangle();
//   final b = GreenShapeDecorator(triangle);
//   final c = BlueShapeDecorator(b);
//   print(c.draw());
// }
