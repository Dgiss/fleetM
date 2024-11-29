import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_card.dart';
import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleCardSlider extends StatefulWidget {
  final List<Vehicle> vehicles;
  final Vehicle? selectedVehicle;
  final Function(Vehicle) onVehicleSelected;
  final PageController pageController;
  final VoidCallback onClose;

  const VehicleCardSlider({
    super.key,
    required this.vehicles,
    required this.selectedVehicle,
    required this.onVehicleSelected,
    required this.pageController,
    required this.onClose,
  });

  @override
  State<VehicleCardSlider> createState() => _VehicleCardSliderState();
}

class _VehicleCardSliderState extends State<VehicleCardSlider> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.vehicles.indexOf(widget.selectedVehicle ?? widget.vehicles.first);
    widget.pageController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (widget.pageController.page != null) {
      int nextPage = widget.pageController.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
          widget.onVehicleSelected(widget.vehicles[_currentPage]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16,
      child: SizedBox(
        height: 160,
        child: PageView.builder(
          controller: widget.pageController,
          itemCount: widget.vehicles.length,
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
          itemBuilder: (context, index) {
            final vehicle = widget.vehicles[index];
            final isSelected = _currentPage == index;
            
            return AnimatedScale(
              scale: isSelected ? 1.0 : 0.9,
              duration: const Duration(milliseconds: 200),
              child: VehicleCard(
                vehicle: vehicle,
                isSelected: isSelected,
                onTap: () => widget.onVehicleSelected(vehicle),
                onClose: widget.onClose,
              ),
            );
          },
        ),
      ),
    );
  }
}