import 'package:equatable/equatable.dart';

class Data extends Equatable {
	final String? star;
	final String? maintenanceTeamId;
	final int? userId;
	final int? id;

	const Data({this.star, this.maintenanceTeamId, this.userId, this.id});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				star: json['star'] as String?,
				maintenanceTeamId: json['maintenance_team_id'] as String?,
				userId: json['user_id'] as int?,
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'star': star,
				'maintenance_team_id': maintenanceTeamId,
				'user_id': userId,
				'id': id,
			};

	@override
	List<Object?> get props => [star, maintenanceTeamId, userId, id];
}
