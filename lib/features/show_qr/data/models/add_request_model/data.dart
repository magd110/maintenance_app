import 'package:equatable/equatable.dart';

import 'team.dart';

class Data extends Equatable {
	final String? freeDay;
	final String? number;
	final String? qrCode;
	final String? notes;
	final String? requestDetails;
	final String? latitude;
	final String? longitude;
	final int? userId;
	final int? teamId;
	final int? elecId;
	final DateTime? updatedAt;
	final DateTime? createdAt;
	final int? id;
	final Team? team;

	const Data({
		this.freeDay, 
		this.number, 
		this.qrCode, 
		this.notes, 
		this.requestDetails, 
		this.latitude, 
		this.longitude, 
		this.userId, 
		this.teamId, 
		this.elecId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
		this.team, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				freeDay: json['free_day'] as String?,
				number: json['number'] as String?,
				qrCode: json['QR_code'] as String?,
				notes: json['notes'] as String?,
				requestDetails: json['request_details'] as String?,
				latitude: json['latitude'] as String?,
				longitude: json['longitude'] as String?,
				userId: json['user_id'] as int?,
				teamId: json['team_id'] as int?,
				elecId: json['elec_id'] as int?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
				team: json['team'] == null
						? null
						: Team.fromJson(json['team'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'free_day': freeDay,
				'number': number,
				'QR_code': qrCode,
				'notes': notes,
				'request_details': requestDetails,
				'latitude': latitude,
				'longitude': longitude,
				'user_id': userId,
				'team_id': teamId,
				'elec_id': elecId,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
				'team': team?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				freeDay,
				number,
				qrCode,
				notes,
				requestDetails,
				latitude,
				longitude,
				userId,
				teamId,
				elecId,
				updatedAt,
				createdAt,
				id,
				team,
		];
	}
}
