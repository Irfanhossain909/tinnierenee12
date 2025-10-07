import 'package:geocoding/geocoding.dart';

/// ✅ Utility class to convert latitude & longitude into readable address.
class LocationUtil {
  LocationUtil._(); // prevent instantiation

  /// Converts [lat] and [lng] (dynamic inputs allowed) into a formatted address.
  ///
  /// Example:
  /// ```dart
  /// final address = await LocationUtil.getAddressFromLatLng(23.8103, 90.4125);
  /// print(address);
  /// ```
  static Future<String> getAddressFromLatLng(dynamic lat, dynamic lng) async {
    try {
      // Convert dynamic values safely to double
      final double latitude = lat is double ? lat : double.parse(lat.toString());
      final double longitude =
          lng is double ? lng : double.parse(lng.toString());

      // Fetch placemarks using geocoding
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        // nicely formatted address string
        final address =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}";
        return address;
      } else {
        return "Address not found";
      }
    } catch (e) {
      return "Error getting address: $e";
    }
  }
}
