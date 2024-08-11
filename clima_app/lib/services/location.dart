import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationSettings locationSettings =
          const LocationSettings(accuracy: LocationAccuracy.low);
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error occured while getting the location: $e');
    }
  }
}
