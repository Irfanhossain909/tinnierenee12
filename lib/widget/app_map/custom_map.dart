

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tinnierenee12/utils/app_size.dart';

class CustomGoogleMap extends StatefulWidget {
  final double latitude;
  final double longitude;

  const CustomGoogleMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    LatLng location = LatLng(widget.latitude, widget.longitude);

    return Container(
      width: double.infinity,
      height: AppSize.size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      clipBehavior: Clip.antiAlias,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: location, zoom: 15),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId('selected-location'),
            position: location,
            infoWindow: const InfoWindow(title: 'Selected Location'),
          ),
        },
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
