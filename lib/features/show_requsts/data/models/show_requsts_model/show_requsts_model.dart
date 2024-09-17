import 'package:equatable/equatable.dart';

import 'team.dart';

class ShowRequstsModel extends Equatable {
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
	final String? requestState;
	final String? consumableParts;
	final String? repairs;
	final String? warrantyState;
	final String? salary;
	final int? userId;
	final int? teamId;
	final int? elecId;
	final dynamic startTime;
	final dynamic endTime;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final String? idapplication;
	final Team? team;

	const ShowRequstsModel({
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
		this.requestState, 
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
		this.idapplication, 
		this.team, 
	});

	factory ShowRequstsModel.fromJson(Map<String, dynamic> json) {
		return ShowRequstsModel(
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
			requestState: json['Request_state'] as String?,
			consumableParts: json['consumable_parts'] as String?,
			repairs: json['repairs'] as String?,
			warrantyState: json['warranty_state'] as String?,
			salary: json['salary'] as String?,
			userId: json['user_id'] as int?,
			teamId: json['team_id'] as int?,
			elecId: json['elec_id'] as int?,
			startTime: json['start_time'] as dynamic,
			endTime: json['end_time'] as dynamic,
			createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
			updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			idapplication: json['idapplication'] as String?,
			team: json['team'] == null
						? null
						: Team.fromJson(json['team'] as Map<String, dynamic>),
		);
	}



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
				'start_time': startTime,
				'end_time': endTime,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'idapplication': idapplication,
				'team': team?.toJson(),
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
				idapplication,
				team,
		];
	}
}
