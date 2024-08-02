import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maintenance_app1/features/add_order/presentation/views/widgets/header_clipper.dart';

class ShowOrdersBody extends StatelessWidget {
  ShowOrdersBody({super.key});
  // @override

  var suburb;
  var name;
  var street;
  Future<String> getReverseGeocoding(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$latitude&lon=$longitude');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print(data);
      final displayName = data['display_name'] as String;
      final addressParts = displayName.split(', ');
      name = addressParts[0];
      suburb = addressParts[1];
      street = addressParts[2];
      print(name);
      print(suburb);
      print(street);
      return '$name, $suburb, $street';
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Maintenance',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue[800],
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.grey[500]!,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // child: Column(
              //   children: [
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              FontAwesomeIcons.wrench, // أيقونة الصيانة
              size: 24.0,
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width, // Set the desired width of the box
                  height:
                      size.height * 0.2, // Set the desired height of the box
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              "2023-07-31 14:30:00",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Text(
                            "2023-07-31 15:30:00",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "دمشق_المزة ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.blue,
                              width: 2.0, // تحديد العرض المطلوب
                              height: 50.0, // تحديد الارتفاع المطلوب
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "0959636242",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width, // Set the desired width of the box
                  height:
                      size.height * 0.2, // Set the desired height of the box
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Text(
                              "2023-07-31 14:30:00",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                // fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Text(
                            "2023-07-31 15:30:00",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                              // fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "دمشق_المزة ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.phone_android_outlined,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "0959636242",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TextButton(
              child: Text("dataa"),
              onPressed: () async {
                print("object");
                await getReverseGeocoding(33.4397141, 36.1626865);
              })
        ],
      ),
    );
  }
}
