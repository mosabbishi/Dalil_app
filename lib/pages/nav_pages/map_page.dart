import 'dart:collection';

import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/models/stores_model.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
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
      viewportFraction: 0.9,
    );
    _setCircles();
    _getCurrentLocation();

    super.initState();
  }

  late GoogleMapController mapController;
  List<Marker> markers = [];
  final Set<Circle> _circles = HashSet<Circle>();
  PageController _pageCintroller = PageController();

  Position? _position;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
            StreamBuilder(
                stream: FireStoreServices.storesCollection.snapshots(),
                builder: (context, snapshot) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 200,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageCintroller,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Styles.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                    child: FancyShimmerImage(
                                      imageUrl: snapshot.data!.docs[index]
                                          ['header-image'],
                                      // boxFit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 120,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['name'],
                                    style: TextStyle(
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(snapshot.data!.docs[index]['address']),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }

//
  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
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
