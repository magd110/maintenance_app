import 'package:equatable/equatable.dart';

import 'maintenance_request.dart';

class ShowOrdersModel extends Equatable {
	final List<MaintenanceRequest>? maintenanceRequests;

	const ShowOrdersModel({this.maintenanceRequests});

	factory ShowOrdersModel.fromJson(Map<String, dynamic> json) {
		return ShowOrdersModel(
			maintenanceRequests: (json['Maintenance Requests'] as List<dynamic>?)
						?.map((e) => MaintenanceRequest.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'Maintenance Requests': maintenanceRequests?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [maintenanceRequests];
}
