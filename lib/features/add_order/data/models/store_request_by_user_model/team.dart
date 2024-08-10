import 'package:equatable/equatable.dart';

class Team extends Equatable {
	final int? id;
	final String? name;
	final String? state;
	final String? latitude;
	final String? longitude;
	final String? locationType;

	const Team({
		this.id, 
		this.name, 
		this.state, 
		this.latitude, 
		this.longitude, 
		this.locationType, 
	});

	factory Team.fromJson(Map<String, dynamic> json) => Team(
				id: json['id'] as int?,
				name: json['name'] as String?,
				state: json['state'] as String?,
				latitude: json['latitude'] as String?,
				longitude: json['longitude'] as String?,
				locationType: json['location_type'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'state': state,
				'latitude': latitude,
				'longitude': longitude,
				'location_type': locationType,
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				state,
				latitude,
				longitude,
				locationType,
		];
	}
}
