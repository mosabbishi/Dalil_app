
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  // determin position method
  static Future<Position> determinePosition() async {
    bool serviceEabled;
    LocationPermission permission;
    // is the location service enabled?
    serviceEabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEabled) {
      return Future.error('error');
    }

    // check if the location service is enabled or not
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('denied');
      }
    }
    // manually enable the location services from settings
    if (permission == LocationPermission.deniedForever) {
      return Future.error('denied forever');
    }
    //
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
//

 static void getPlace(Position pos) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(pos.latitude, pos.longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name.toString();
    String subLocality = placeMark.subLocality.toString();
    String locality = placeMark.locality.toString();
    String administrativeArea = placeMark.administrativeArea.toString();
    String postalCode = placeMark.postalCode.toString();
    String country = placeMark.country.toString();
    String address = "$name,$subLocality,\n$locality,$postalCode,\n$administrativeArea,$country";
    // _userlocctrl.text = address;
  }
}
