import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_bottom_sheet.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_card_slider.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_map.dart';
import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DraggableScrollableController _bottomSheetController = DraggableScrollableController();
  final PageController _pageController = PageController(viewportFraction: 0.85);
  Vehicle? _selectedVehicle;
  bool _isExpanded = false;
  bool _showBottomSheet = true;
  bool _showHorizontalCards = false;
  GoogleMapController? _mapController;

  void _onVehicleSelected(Vehicle vehicle, {bool fromMap = false}) {
    setState(() {
      _selectedVehicle = vehicle;
      _showBottomSheet = false;
      _showHorizontalCards = true;
    });

    // Center and zoom map on selected vehicle
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: vehicle.location,
          zoom: 15,
        ),
      ),
    );

    if (fromMap) {
      // Animate to the correct page when selected from map
      final index = Vehicle.dummyVehicles.indexOf(vehicle);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onVehicleCardClosed() {
    setState(() {
      _selectedVehicle = null;
      _showBottomSheet = true;
      _showHorizontalCards = false;
    });
  }

  void _toggleBottomSheet() {
    setState(() {
      _isExpanded = !_isExpanded;
      _bottomSheetController.animateTo(
        _isExpanded ? 0.6 : 0.1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    _pageController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          VehicleMap(
            onMapCreated: (controller) => _mapController = controller,
            selectedVehicle: _selectedVehicle,
            onVehicleSelected: (vehicle) => _onVehicleSelected(vehicle, fromMap: true),
          ),
          if (_showHorizontalCards && _selectedVehicle != null)
            VehicleCardSlider(
              vehicles: Vehicle.dummyVehicles,
              selectedVehicle: _selectedVehicle,
              onVehicleSelected: _onVehicleSelected,
              pageController: _pageController,
              onClose: _onVehicleCardClosed,
            ),
          if (_showBottomSheet)
            VehicleBottomSheet(
              controller: _bottomSheetController,
              selectedVehicle: _selectedVehicle,
              onVehicleSelected: _onVehicleSelected,
              onHeaderTap: _toggleBottomSheet,
              isExpanded: _isExpanded,
            ),
        ],
      ),
    );
  }
}