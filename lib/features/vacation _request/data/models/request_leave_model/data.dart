import 'package:equatable/equatable.dart';

class Data extends Equatable {
	final int? workerId;
	final String? reason;
	final String? status;
	final DateTime? endDate;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;

	const Data({
		this.workerId, 
		this.reason, 
		this.status, 
		this.endDate, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				workerId: json['worker_id'] as int?,
				reason: json['reason'] as String?,
				status: json['status'] as String?,
				endDate: json['end_date'] == null
						? null
						: DateTime.parse(json['end_date'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'worker_id': workerId,
				'reason': reason,
				'status': status,
				'end_date': endDate?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};

	@override
	List<Object?> get props {
		return [
				workerId,
				reason,
				status,
				endDate,
				updatedAt,
				createdAt,
				id,
		];
	}
}
