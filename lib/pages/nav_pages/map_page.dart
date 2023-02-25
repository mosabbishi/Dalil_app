import 'dart:collection';

import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/models/stores_model.dart';
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
    _pageCintroller = PageController(
      initialPage: 0,
      viewportFraction: 0.3,
    );
    _setCircles();
    _getCurrentLocation();
    stores.forEach((element) {
      markers.add(
        Marker(
          markerId: MarkerId(element.name!),
          draggable: false,
          infoWindow: InfoWindow(
            title: element.name!,
            snippet: element.address!,
          ),
          position: element.location!,
        ),
      );
    });
    super.initState();
  }

  late GoogleMapController mapController;
  List<Marker> markers = [];
  final Set<Circle> _circles = HashSet<Circle>();
  PageController _pageCintroller = PageController();

  Position? _position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPostion,
            markers: Set.from(markers),
            mapType: MapType.normal,
            mapToolbarEnabled: true,
            myLocationEnabled: true,
            onMapCreated: onMapCreated,
            circles: _circles,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.white,
          //     onPressed: () async {
          //       Position position = await LocationService().determinePosition();
          //       mapController.animateCamera(
          //         CameraUpdate.newCameraPosition(
          //           CameraPosition(
          //               target: LatLng(position.latitude, position.longitude),
          //               zoom: 13),
          //         ),
          //       );
          //       markers.clear();
          //       markers.add(
          //         Marker(
          //           markerId: MarkerId('value'),
          //           position: LatLng(position.latitude, position.longitude),
          //           infoWindow: InfoWindow(
          //             title: 'makkah',
          //           ),
          //         ),
          //       );
          //       _getCurrentLocation();
          //     },
          //     child: FaIcon(
          //       FontAwesomeIcons.location,
          //       color: Styles.red,
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 130,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageCintroller,
              itemCount: stores.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: colors[index],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_box, size: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(stores[index].name!),
                            Text(stores[index].address!),
                            Text(stores[index].desc!),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }

  List colors = [
    Colors.amberAccent,
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.orangeAccent,
  ];
//
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

//
  void _setCircles() {
    _circles.add(
      const Circle(
        circleId: CircleId('0'),
        center: LatLng(21.3910, 39.8540),
        fillColor: Color.fromARGB(31, 87, 84, 84),
        radius: 4200,
        strokeWidth: 1,
        strokeColor: Colors.lightBlue,
      ),
    );
  }
//

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

//
  late CameraPosition _initialCameraPostion =
      CameraPosition(target: LatLng(21.3910, 39.8540), zoom: 12.0);
}
