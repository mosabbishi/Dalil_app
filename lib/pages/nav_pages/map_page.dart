import 'package:dalil_app/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _position = position;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
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
                  initialCameraPosition: const CameraPosition(
                      target: LatLng(21.3910, 39.8540), zoom: 14.0),
                  mapType: MapType.normal,
                  buildingsEnabled: true,
                  compassEnabled: true,
                  indoorViewEnabled: true,
                  mapToolbarEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: _onMapCreated,
                  
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _getCurrentLocation,
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
