import 'dart:collection';

import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    _setCircles();
    _getCurrentLocation();
    super.initState();
  }

  late GoogleMapController mapController;
  late CameraPosition _initialCameraPostion =
      CameraPosition(target: LatLng(21.3910, 39.8540), zoom: 12.0);
  Set<Marker> markers = HashSet<Marker>();
  final Set<Circle> _circles = HashSet<Circle>();

  Position? _position;

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(21.3910, 39.8540);
    GeocodingPlatform.instance
        .locationFromAddress('${position.latitude}, ${position.longitude}');
    setState(() {
      _position = position;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _setCircles() {
    _circles.add(
      Circle(
        circleId: CircleId('0'),
        center: LatLng(21.3910, 39.8540),
        fillColor: Color.fromARGB(31, 87, 84, 84),
        radius: 4200,
        strokeWidth: 1,
        strokeColor: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(alignment: Alignment.bottomLeft, children: [
                GoogleMap(
                  initialCameraPosition: _initialCameraPostion,
                  markers: markers,
                  mapType: MapType.normal,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: onMapCreated,
                  circles: _circles,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      Position position =
                          await LocationService().determinePosition();
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                              target:
                                  LatLng(position.latitude, position.longitude),
                              zoom: 13),
                        ),
                      );
                      markers.clear();
                      markers.add(
                        Marker(
                          markerId: MarkerId('value'),
                          position:
                              LatLng(position.latitude, position.longitude),
                          infoWindow: InfoWindow(
                            title: 'makkah',
                          ),
                        ),
                      );
                      _getCurrentLocation();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.location,
                      color: Styles.red,
                    ),
                  ),
                ),
              ]),
            ),
            Center(
              child: _position != null
                  ? Column(
                      children: [
                        Text('location: $_position'),
                        Text('${_position}'),
                      ],
                    )
                  : Text('not detected'),
            ),
          ],
        ),
      ),
    );
  }
}
