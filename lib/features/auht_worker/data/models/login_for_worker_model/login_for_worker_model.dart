import 'package:equatable/equatable.dart';

import 'user.dart';

class LoginForWorkerModel extends Equatable {
	final User? user;
	final String? accessToken;

	const LoginForWorkerModel({this.user, this.accessToken});

	factory LoginForWorkerModel.fromJson(Map<String, dynamic> json) {
		return LoginForWorkerModel(
			user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
			accessToken: json['access_token'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'user': user?.toJson(),
				'access_token': accessToken,
			};

	@override
	List<Object?> get props => [user, accessToken];
}
