import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/trip_list.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_details_header.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/vehicle_details_map.dart';
import 'package:fleet_watcher_mobile/models/trip.dart';
import 'package:fleet_watcher_mobile/models/vehicle.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({
    super.key,
    required this.vehicle,
  });

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  List<DateTime?> _selectedDates = [DateTime.now()];
  bool _isLoading = false;
  Trip? _selectedTrip;

  String _formatDateRange() {
    if (_selectedDates.isEmpty || _selectedDates[0] == null) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
    if (_selectedDates.length == 1 || _selectedDates[1] == null) {
      return DateFormat('dd/MM/yyyy').format(_selectedDates[0]!);
    }
    return '${DateFormat('dd/MM/yyyy').format(_selectedDates[0]!)} - ${DateFormat('dd/MM/yyyy').format(_selectedDates[1]!)}';
  }

  void _onTripSelected(Trip trip) {
    setState(() {
      _selectedTrip = _selectedTrip?.id == trip.id ? null : trip;
    });
  }

  Future<void> _showDatePicker() async {
    final now = DateTime.now();
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: MyColors.primary,
      lastDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      weekdayLabelTextStyle: const TextStyle(
        color: MyColors.primary,
        fontWeight: FontWeight.bold,
      ),
      yearTextStyle: const TextStyle(
        color: MyColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );

    final dates = await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
      value: _selectedDates,
      dialogBackgroundColor: Colors.white,
    );

    if (dates != null && dates.isNotEmpty) {
      // Validate date range
      if (dates.length == 2 && dates[0] != null && dates[1] != null) {
        final difference = dates[1]!.difference(dates[0]!).inDays;
        if (difference > 7) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('La plage de dates ne peut pas dépasser 7 jours'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }

      setState(() {
        _selectedDates = dates;
        _selectedTrip = null;
        _isLoading = true;
      });
      
      // Simulate loading new data
      await Future.delayed(const Duration(seconds: 1));
      
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VehicleDetailsHeader(
            vehicle: widget.vehicle,
            selectedDates: _selectedDates,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: VehicleDetailsMap(
              vehicle: widget.vehicle,
              selectedTrip: _selectedTrip,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: _showDatePicker,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.primary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDateRange(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: MyColors.primary,
                      ),
                    ),
                    const Icon(Icons.calendar_today, color: MyColors.primary),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            Expanded(
              child: TripList(
                startDate: _selectedDates[0]!,
                endDate: _selectedDates.length > 1 && _selectedDates[1] != null 
                    ? _selectedDates[1]! 
                    : _selectedDates[0]!,
                vehicleId: widget.vehicle.id,
                onTripSelected: _onTripSelected,
              ),
            ),
        ],
      ),
    );
  }
}