import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterData extends Equatable {
  final User? user;

  const RegisterData({this.user});

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [user];
}
