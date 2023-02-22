
import 'package:geolocator/geolocator.dart';

class LocationService {
  

  // determin position method
  Future<Position> determinePosition() async {
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
}
