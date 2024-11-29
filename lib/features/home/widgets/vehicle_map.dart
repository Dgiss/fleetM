import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleMap extends StatefulWidget {
  final Function(GoogleMapController)? onMapCreated;
  final Vehicle? selectedVehicle;
  final Function(Vehicle) onVehicleSelected;

  const VehicleMap({
    super.key,
    this.onMapCreated,
    this.selectedVehicle,
    required this.onVehicleSelected,
  });

  @override
  State<VehicleMap> createState() => _VehicleMapState();
}

class _VehicleMapState extends State<VehicleMap> {
  Set<Marker> _markers = {};
  
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(48.8566, 2.3522), // Paris coordinates
    zoom: 12,
  );

  @override
  void initState() {
    super.initState();
    _updateMarkers();
  }

  @override
  void didUpdateWidget(VehicleMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedVehicle != widget.selectedVehicle) {
      _updateMarkers();
    }
  }

  void _updateMarkers() {
    _markers = {};
    for (var vehicle in Vehicle.dummyVehicles) {
      final isSelected = widget.selectedVehicle?.id == vehicle.id;
      final marker = Marker(
        markerId: MarkerId(vehicle.id),
        position: vehicle.location,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          vehicle.status == 'En mouvement' 
              ? BitmapDescriptor.hueGreen 
              : BitmapDescriptor.hueRed,
        ),
        zIndex: isSelected ? 2 : 1,
        onTap: () => widget.onVehicleSelected(vehicle),
      );
      _markers.add(marker);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: widget.onMapCreated,
      markers: _markers,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
    );
  }
}