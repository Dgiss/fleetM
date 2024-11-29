import 'package:fleet_watcher_mobile/features/home/screens/vehicle_details_screen.dart';
import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class VehicleBottomSheet extends StatelessWidget {
  final DraggableScrollableController controller;
  final Vehicle? selectedVehicle;
  final Function(Vehicle) onVehicleSelected;
  final VoidCallback onHeaderTap;
  final bool isExpanded;

  const VehicleBottomSheet({
    super.key,
    required this.controller,
    this.selectedVehicle,
    required this.onVehicleSelected,
    required this.onHeaderTap,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.6,
      controller: controller,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header - Made tappable
              GestureDetector(
                onTap: onHeaderTap,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      // Drag Handle
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Vehicle Count - Centered
                      Center(
                        child: Text(
                          '${Vehicle.dummyVehicles.length} Véhicules Trouvés',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Vehicle List
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: Vehicle.dummyVehicles.length,
                  itemBuilder: (context, index) {
                    final vehicle = Vehicle.dummyVehicles[index];
                    final isSelected = selectedVehicle?.id == vehicle.id;
                    final isMoving = vehicle.status == 'En mouvement';

                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isMoving ? Colors.green : Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.directions_car,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          title: Text(
                            vehicle.licensePlate,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                vehicle.driverName,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${vehicle.speed} km/h - ${vehicle.fuel}% carburant',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          selected: isSelected,
                          onTap: () {
                            onVehicleSelected(vehicle);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VehicleDetailsScreen(vehicle: vehicle),
                              ),
                            );
                          },
                        ),
                        if (index < Vehicle.dummyVehicles.length - 1)
                          const Divider(height: 1),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
