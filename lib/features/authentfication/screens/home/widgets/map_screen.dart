import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child: const Center(
        //   child: Text(
        //     "Coming soon :)",
        //   ),
        // ),
      ),
    );
  }
}
