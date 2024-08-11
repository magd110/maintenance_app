import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? id;
	final String? name;
	final String? email;
	final String? password;
	final String? role;
	final dynamic emailVerifiedAt;
	final dynamic rememberToken;

	const User({
		this.id, 
		this.name, 
		this.email, 
		this.password, 
		this.role, 
		this.emailVerifiedAt, 
		this.rememberToken, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				role: json['role'] as String?,
				emailVerifiedAt: json['email_verified_at'] as dynamic,
				rememberToken: json['remember_token'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'password': password,
				'role': role,
				'email_verified_at': emailVerifiedAt,
				'remember_token': rememberToken,
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				email,
				password,
				role,
				emailVerifiedAt,
				rememberToken,
		];
	}
}
