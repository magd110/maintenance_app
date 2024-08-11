import 'package:equatable/equatable.dart';

import 'data.dart';

class UpdateRequestByWorkerModel extends Equatable {
	final String? message;
	final Data? data;

	const UpdateRequestByWorkerModel({this.message, this.data});

	factory UpdateRequestByWorkerModel.fromJson(Map<String, dynamic> json) {
		return UpdateRequestByWorkerModel(
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
