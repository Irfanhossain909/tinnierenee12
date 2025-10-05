import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/service/api/location_permission.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class LocationController extends GetxController {
  TextEditingController searchController = TextEditingController();
  LocationService getLocation = LocationService.instance;

  // Reactive variables to store search query
  var searchQuery = ''.obs;
  // Reactive variables to store location data

  var isLoading = false.obs;
  var selectedPlaceId = ''.obs;
  var selectedAddress = ''.obs;
  var selectedLatitude = 0.0.obs;
  var selectedLongitude = 0.0.obs;
  var isCurrentLocation = false.obs;

  ///Functions GetLocation
  Future<void> fetchUserLocation() async {
    isLoading.value = true;
    // Call location permission and fetch location
    await LocationService.instance.requestLocationPermission();

    // Get location data from LocationService
    final address = LocationService.instance.userAddress;
    final lat = LocationService.instance.latitude;
    final lng = LocationService.instance.longitude;

    // If location found successfully, set values
    if (lat != null && lng != null && address != null) {
      selectedLatitude.value = double.parse(lat);
      selectedLongitude.value = double.parse(lng);
      selectedAddress.value = address;
      selectedPlaceId.value = 'current_location';
      isCurrentLocation.value = true;

      // Update search controller to show current location
      searchController.text = address;

      AppPrint.apiResponse(
        "User location:\n"
        "Address: $address\n"
        "Latitude: $lat\n"
        "Longitude: $lng",
      );

      isLoading.value = false;
    } else {
      // Handle case where location not found
      isCurrentLocation.value = false;
      isLoading.value = false;
      AppPrint.appError('Failed to fetch user location');
    }
    isLoading.value = false;
  }

  // Handle place selection from PlaceAutocompleteWidget
  void onPlaceSelected(
    String placeId,
    String description, {
    bool isCurrentLocation = false,
    double? lat,
    double? lng,
  }) {
    // Update all location data
    selectedPlaceId.value = placeId;
    selectedAddress.value = description;
    this.isCurrentLocation.value = isCurrentLocation;

    if (lat != null && lng != null) {
      selectedLatitude.value = lat;
      selectedLongitude.value = lng;

      AppPrint.apiResponse(
        "Selected place: $description\n"
        "Place ID: $placeId\n"
        "Latitude: $lat\n"
        "Longitude: $lng\n"
        "Is Current Location: $isCurrentLocation",
      );
    } else {
      AppPrint.apiResponse(
        "Selected place: $description\n"
        "Place ID: $placeId\n"
        "⚠️ Lat/Lng not available\n"
        "Is Current Location: $isCurrentLocation",
      );
    }
  }

  // Check if current location data is available
  bool get hasLocationData {
    return selectedAddress.value.isNotEmpty &&
        selectedLatitude.value != 0.0 &&
        selectedLongitude.value != 0.0;
  }

  // Clear location data
  void clearLocation() {
    selectedPlaceId.value = '';
    selectedAddress.value = '';
    selectedLatitude.value = 0.0;
    selectedLongitude.value = 0.0;
    isCurrentLocation.value = false;
  }

  // Get location as Map
  Map<String, dynamic> getLocationData() {
    return {
      'place_id': selectedPlaceId.value,
      'address': selectedAddress.value,
      'latitude': selectedLatitude.value,
      'longitude': selectedLongitude.value,
      'is_current_location': isCurrentLocation.value,
    };
  }
}
