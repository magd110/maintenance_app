import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetermineLocation extends StatefulWidget {
  const DetermineLocation({super.key});

  @override
  State<DetermineLocation> createState() => _DetermineLocationState();
}

class _DetermineLocationState extends State<DetermineLocation> {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  ///
  Position? position;
  late final CameraPosition _kGooglePlex;
  Future<Position?> getCurrentLocationApp() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print(" الرجاء ");
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('الرجاء تشغيل خدمة الموقع على جهازك');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    if (permission == LocationPermission.whileInUse) {
      _kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
      print("==============================");

      print(position!.latitude);
      print(position!.longitude);
      print("==============================");
    }
    return position;
  }

  Future<void> _determinePosition() async {
    LocationPermission permission;
   permission = await Geolocator.requestPermission();
   
    position = await Geolocator.getCurrentPosition();
    _kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    print("==============================");

    print(position!.latitude);
    print(position!.longitude);
    print("==============================");
    setState(() {});
  }

  @override
  void initState() {
    _determinePosition();
    // getCurrentLocationApp();
    super.initState();
  }

  // CameraPosition _initialLocation = CameraPosition(
  //     target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);
  late GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade700,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              // Add your custom logic here
              Navigator.of(context).pop();
            },
          ),
        ),
        body: position != null
            ? GoogleMap(
                initialCameraPosition: _kGooglePlex,
                // other map configuration
              )
            : const Center(child: CircularProgressIndicator()),

        //  GoogleMap(
        //   initialCameraPosition: _initialLocation,
        //   myLocationEnabled: true,
        //   myLocationButtonEnabled: false,
        //   mapType: MapType.normal,
        //   zoomGesturesEnabled: true,
        //   zoomControlsEnabled: false,
        //   onMapCreated: (GoogleMapController controller) {
        //     mapController = controller;
        //   },
        // ),
      ),
    );
  }
}
