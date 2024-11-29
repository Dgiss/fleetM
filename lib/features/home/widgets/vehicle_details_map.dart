import 'package:fleet_watcher_mobile/models/trip.dart';
import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleDetailsMap extends StatefulWidget {
  final Vehicle vehicle;
  final Trip? selectedTrip;

  const VehicleDetailsMap({
    super.key,
    required this.vehicle,
    this.selectedTrip,
  });

  @override
  State<VehicleDetailsMap> createState() => _VehicleDetailsMapState();
}

class _VehicleDetailsMapState extends State<VehicleDetailsMap> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _updateMapData();
  }

  @override
  void didUpdateWidget(VehicleDetailsMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTrip != widget.selectedTrip) {
      _updateMapData();
    }
  }

  void _updateMapData() {
    _markers = {};
    _polylines = {};
    
    if (widget.selectedTrip != null) {
      // Add route points markers
      for (int i = 0; i < widget.selectedTrip!.routePoints.length; i++) {
        final point = widget.selectedTrip!.routePoints[i];
        final isStart = i == 0;
        final isEnd = i == widget.selectedTrip!.routePoints.length - 1;
        
        _markers.add(
          Marker(
            markerId: MarkerId('point_$i'),
            position: point,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              isStart ? BitmapDescriptor.hueGreen :
              isEnd ? BitmapDescriptor.hueRed :
              BitmapDescriptor.hueAzure
            ),
            infoWindow: InfoWindow(
              title: isStart ? 'Départ' :
                     isEnd ? 'Arrivée' :
                     'Point de passage ${i + 1}',
              snippet: isStart ? widget.selectedTrip!.startLocation :
                       isEnd ? widget.selectedTrip!.endLocation :
                       'Étape intermédiaire'
            ),
          ),
        );
      }

      // Add route polyline
      _polylines.add(
        Polyline(
          polylineId: PolylineId(widget.selectedTrip!.id),
          points: widget.selectedTrip!.routePoints,
          color: MyColors.primary,
          width: 5,
          patterns: [
            PatternItem.dash(20),
            PatternItem.gap(10),
          ],
        ),
      );

      // Animate camera to show the entire route
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_mapController != null) {
          _mapController.animateCamera(
            CameraUpdate.newLatLngBounds(
              _getBoundsForPoints(widget.selectedTrip!.routePoints),
              50,
            ),
          );
        }
      });
    } else {
      // Show vehicle current position if no trip is selected
      _markers.add(
        Marker(
          markerId: MarkerId(widget.vehicle.id),
          position: widget.vehicle.location,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            widget.vehicle.status == 'En mouvement'
                ? BitmapDescriptor.hueGreen
                : BitmapDescriptor.hueRed,
          ),
          infoWindow: InfoWindow(
            title: widget.vehicle.licensePlate,
            snippet: '${widget.vehicle.speed} km/h - ${widget.vehicle.fuel}% carburant',
          ),
        ),
      );
    }

    setState(() {});
  }

  LatLngBounds _getBoundsForPoints(List<LatLng> points) {
    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (var point in points) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(minLat - 0.01, minLng - 0.01),
      northeast: LatLng(maxLat + 0.01, maxLng + 0.01),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.vehicle.location,
        zoom: 13,
      ),
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
        if (widget.selectedTrip != null) {
          _updateMapData();
        }
      },
      markers: _markers,
      polylines: _polylines,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      myLocationEnabled: false,
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}