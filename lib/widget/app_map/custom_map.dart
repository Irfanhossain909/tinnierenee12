import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
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
  bool _isMapLoading = true;

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
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: location, zoom: 15),
            onMapCreated: (controller) {
              mapController = controller;
              Future.delayed(const Duration(seconds: 1), () {
                if (mounted) {
                  setState(() {
                    _isMapLoading = false;
                  });
                }
              });
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

          /// ----- SHIMMER LAYER -----
          if (_isMapLoading)
            Positioned.fill(
              child: Shimmer(
                colorOpacity: 0.4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade300,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Simulated "roads" (horizontal & vertical lines)
                      ...List.generate(
                        4,
                        (index) => Positioned(
                          top: (AppSize.size.height * 0.25 / 5) * index,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            color: Colors.white.withValues(alpha: .5),
                          ),
                        ),
                      ),
                      ...List.generate(
                        3,
                        (index) => Positioned(
                          left: (AppSize.size.width / 3.5) * index,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 2,
                            color: Colors.white.withValues(alpha: .4),
                          ),
                        ),
                      ),

                      // Fake marker circle (center)
                      Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: .8),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .1),
                                blurRadius: 4,
                              )
                            ],
                          ),
                        ),
                      ),

                      // Simulated zoom buttons (bottom right)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Column(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .9),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: .1),
                                    blurRadius: 3,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: .9),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: .1),
                                    blurRadius: 3,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tinnierenee12/utils/app_size.dart';

// class CustomGoogleMap extends StatefulWidget {
//   final double latitude;
//   final double longitude;

//   const CustomGoogleMap({
//     super.key,
//     required this.latitude,
//     required this.longitude,
//   });

//   @override
//   State<CustomGoogleMap> createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   GoogleMapController? mapController;

//   @override
//   Widget build(BuildContext context) {
//     LatLng location = LatLng(widget.latitude, widget.longitude);

//     return Container(
//       width: double.infinity,
//       height: AppSize.size.height * 0.25,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.grey.shade200,
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(target: location, zoom: 15),
//         onMapCreated: (controller) {
//           mapController = controller;
//         },
//         markers: {
//           Marker(
//             markerId: const MarkerId('selected-location'),
//             position: location,
//             infoWindow: const InfoWindow(title: 'Selected Location'),
//           ),
//         },
//         myLocationButtonEnabled: true,
//         zoomControlsEnabled: true,
//       ),
//     );
//   }
// }
