import 'package:fleet_watcher_mobile/models/trip.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripList extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String vehicleId;
  final Function(Trip)? onTripSelected;

  const TripList({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.vehicleId,
    this.onTripSelected,
  });

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  Trip? selectedTrip;

  @override
  Widget build(BuildContext context) {
    final trips = Trip.getDummyTrips(widget.vehicleId, widget.startDate, widget.endDate);

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final trip = trips[index];
        final isSelected = selectedTrip?.id == trip.id;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTrip = isSelected ? null : trip;
            });
            widget.onTripSelected?.call(trip);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? MyColors.primary : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: isSelected 
                      ? MyColors.primary.withOpacity(0.2)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(trip.startTime),
                    style: TextStyle(
                      color: isSelected ? MyColors.primary : Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on, 
                        color: isSelected ? MyColors.primary : Colors.grey[600],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Départ: ${DateFormat('HH:mm').format(trip.startTime)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: isSelected ? MyColors.primary : Colors.black,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? MyColors.primary 
                                        : MyColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${trip.distance} km',
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : MyColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              trip.startLocation,
                              style: TextStyle(
                                color: isSelected ? Colors.black87 : Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: isSelected ? MyColors.primary.withOpacity(0.2) : Colors.grey[300],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: isSelected ? Colors.red[700] : Colors.red,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Arrivée: ${DateFormat('HH:mm').format(trip.endTime)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: isSelected ? MyColors.primary : Colors.black,
                              ),
                            ),
                            Text(
                              trip.endLocation,
                              style: TextStyle(
                                color: isSelected ? Colors.black87 : Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}