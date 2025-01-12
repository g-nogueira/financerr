class User {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt.toIso8601String(),
      'is_active': isActive ? 1 : 0,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      createdAt: DateTime.parse(map['created_at']),
      isActive: map['is_active'] == 1,
    );
  }
}