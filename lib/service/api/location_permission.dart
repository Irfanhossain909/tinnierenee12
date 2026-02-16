

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class LocationService {
  LocationService._();
  static final LocationService instance = LocationService._();
  // Variable to store the address
  String? userAddress;
  String? latitude;
  String? longitude;
  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    //     // If permission is denied, ask again
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // If still denied after requesting
    if (permission == LocationPermission.denied) {
      AppPrint.appLog('User denied location permission. Asking again...');
      // Ask again next time user tries (so don't block)
      return;
    }

    // If permanently denied, open settings
    if (permission == LocationPermission.deniedForever) {
      AppPrint.appError(
        'Location permissions permanently denied. Opening settings...',
      );
      await Geolocator.openAppSettings();
      return;
    }

    

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // Location permissions are granted. Now, get the current location
      await _getCurrentLocation();
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Get the current position (latitude and longitude)
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      AppPrint.appLog(
        'Current Location: ${position.latitude}, ${position.longitude}',
      );
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      // Convert latitude and longitude to address
      await _getAddressFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      AppPrint.appError('Error getting location: $e');
    }
  }

  Future<void> _getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      // Get the address from the coordinates (latitude and longitude)
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      // Get the first placemark (address)
      Placemark place = placemarks[0];

      // Format the address string
      userAddress = '${place.street}, ${place.locality}, ${place.country}';
      AppPrint.appLog('Address: $userAddress');
    } catch (e) {
      AppPrint.appError('Error getting address: $e');
    }
  }
}
