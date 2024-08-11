import 'package:equatable/equatable.dart';

class Data extends Equatable {
	final int? id;
	final String? freeDay;
	final String? number;
	final dynamic qrCode;
	final dynamic video;
	final String? notes;
	final String? requestDetails;
	final String? latitude;
	final String? longitude;
	final String? locationType;
	final String? requestState1;
	final String? consumableParts;
	final String? repairs;
	final String? warrantyState;
	final String? salary;
	final int? userId;
	final int? teamId;
	final int? elecId;
	final DateTime? startTime;
	final DateTime? endTime;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final String? requestState;

	const Data({
		this.id, 
		this.freeDay, 
		this.number, 
		this.qrCode, 
		this.video, 
		this.notes, 
		this.requestDetails, 
		this.latitude, 
		this.longitude, 
		this.locationType, 
		this.requestState1, 
		this.consumableParts, 
		this.repairs, 
		this.warrantyState, 
		this.salary, 
		this.userId, 
		this.teamId, 
		this.elecId, 
		this.startTime, 
		this.endTime, 
		this.createdAt, 
		this.updatedAt, 
		this.requestState, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				freeDay: json['free_day'] as String?,
				number: json['number'] as String?,
				qrCode: json['QR_code'] as dynamic,
				video: json['video'] as dynamic,
				notes: json['notes'] as String?,
				requestDetails: json['Request_details'] as String?,
				latitude: json['latitude'] as String?,
				longitude: json['longitude'] as String?,
				locationType: json['location_type'] as String?,
				requestState1: json['Request_state'] as String?,
				consumableParts: json['consumable_parts'] as String?,
				repairs: json['repairs'] as String?,
				warrantyState: json['warranty_state'] as String?,
				salary: json['salary'] as String?,
				userId: json['user_id'] as int?,
				teamId: json['team_id'] as int?,
				elecId: json['elec_id'] as int?,
				startTime: json['start_time'] == null
						? null
						: DateTime.parse(json['start_time'] as String),
				endTime: json['end_time'] == null
						? null
						: DateTime.parse(json['end_time'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				requestState: json['request_state'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'free_day': freeDay,
				'number': number,
				'QR_code': qrCode,
				'video': video,
				'notes': notes,
				'Request_details': requestDetails,
				'latitude': latitude,
				'longitude': longitude,
				'location_type': locationType,
				'Request_state': requestState,
				'consumable_parts': consumableParts,
				'repairs': repairs,
				'warranty_state': warrantyState,
				'salary': salary,
				'user_id': userId,
				'team_id': teamId,
				'elec_id': elecId,
				'start_time': startTime?.toIso8601String(),
				'end_time': endTime?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'request_state': requestState,
			};

	@override
	List<Object?> get props {
		return [
				id,
				freeDay,
				number,
				qrCode,
				video,
				notes,
				requestDetails,
				latitude,
				longitude,
				locationType,
				requestState,
				consumableParts,
				repairs,
				warrantyState,
				salary,
				userId,
				teamId,
				elecId,
				startTime,
				endTime,
				createdAt,
				updatedAt,
				requestState,
		];
	}
}
