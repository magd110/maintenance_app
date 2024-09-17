import 'package:equatable/equatable.dart';

import 'data.dart';

class RatingModel extends Equatable {
	final String? message;
	final Data? data;

	const RatingModel({this.message, this.data});

	factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
				message: json['message'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};

	@override
	List<Object?> get props => [message, data];
}
