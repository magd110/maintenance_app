import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? role;
  final int? id;

  const User({this.name, this.email, this.password, this.role, this.id});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        role: json['role'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'role': role,
        'id': id,
      };

  @override
  List<Object?> get props => [name, email, password, role, id];
}
