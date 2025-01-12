import 'package:flutter_test/flutter_test.dart';
import 'package:financerr/models/user.dart';

void main() {
  test('User model toMap and fromMap', () {
    final user = User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      createdAt: DateTime.now(),
      isActive: true,
    );

    final userMap = user.toMap();
    final newUser = User.fromMap(userMap);

    expect(newUser.id, user.id);
    expect(newUser.name, user.name);
    expect(newUser.email, user.email);
    expect(newUser.createdAt, user.createdAt);
    expect(newUser.isActive, user.isActive);
  });
}