import 'package:equatable/equatable.dart';

class ElectricsModel extends Equatable {
	final int? id;
	final String? name;
	final String? photo;
	final int? size;
	final String? warning;
	final String? notes;
	final String? wayOfWork;
	final String? warrantyState;
	final String? warrantyDate;

	const ElectricsModel({
		this.id, 
		this.name, 
		this.photo, 
		this.size, 
		this.warning, 
		this.notes, 
		this.wayOfWork, 
		this.warrantyState, 
		this.warrantyDate, 
	});

	factory ElectricsModel.fromJson(Map<String, dynamic> json) {
		return ElectricsModel(
			id: json['id'] as int?,
			name: json['name'] as String?,
			photo: json['photo'] as String?,
			size: json['size'] as int?,
			warning: json['warning'] as String?,
			notes: json['notes'] as String?,
			wayOfWork: json['way_of_work'] as String?,
			warrantyState: json['warranty_state'] as String?,
			warrantyDate: json['warranty_date'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'photo': photo,
				'size': size,
				'warning': warning,
				'notes': notes,
				'way_of_work': wayOfWork,
				'warranty_state': warrantyState,
				'warranty_date': warrantyDate,
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				photo,
				size,
				warning,
				notes,
				wayOfWork,
				warrantyState,
				warrantyDate,
		];
	}
}
