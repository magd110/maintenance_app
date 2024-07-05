import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginModel extends Equatable {
  final User? user;
  final String? accessToken;

  const LoginModel({this.user, this.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['access_token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'access_token': accessToken,
      };

  @override
  List<Object?> get props => [user, accessToken];
}
