abstract class Entity {
  late String id;

  Entity(this.id);
}

class User implements Entity {
  late String username;
  late String password;
  late String email;

  User(this.id, this.username, this.password, this.email);

  @override
  late String id;
}
