import 'package:equatable/equatable.dart';

import 'data.dart';

class AddRequestModel extends Equatable {
	final String? message;
	final Data? data;

	const AddRequestModel({this.message, this.data});

	factory AddRequestModel.fromJson(Map<String, dynamic> json) {
		return AddRequestModel(
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};

	@override
	List<Object?> get props => [message, data];
}
