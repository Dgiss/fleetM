import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/boitier_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/row_traget_rapport_widget.dart';
import 'package:fleet_watcher_mobile/models/fake/boitier_traget_fake_data.dart';
import 'package:fleet_watcher_mobile/models/fake/fake_boitier_data.dart';

class BoitierDetailsScreen extends StatefulWidget {
  const BoitierDetailsScreen({super.key, this.id});
  final int? id;

  @override
  State<BoitierDetailsScreen> createState() => _BoitierDetailsScreenState();
}

class _BoitierDetailsScreenState extends State<BoitierDetailsScreen> {
  List<DateTime> _selectedDates = [];
  DateTime today = DateTime.now();

  // Format Date
  String _formatDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  // Display selected dates
  String _displaySelectedDates() {
    if (_selectedDates.isEmpty) {
      return _formatDate(today);
    } else if (_selectedDates.length == 1) {
      return _formatDate(_selectedDates.first);
    } else {
      return '${_formatDate(_selectedDates.first)} - ${_formatDate(_selectedDates.last)}';
    }
  }

  // Show Date Picker Dialog
  Future<void> _showDatePickerDialog() async {
    final config = CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.blueAccent,
    );

    final selectedDates = await showCalendarDatePicker2Dialog(
      context: context,
      config: config,
      value: _selectedDates,
      dialogSize: const Size(350, 400),
      borderRadius: BorderRadius.circular(15),
      dialogBackgroundColor: Colors.white,
    );

    if (selectedDates != null && selectedDates.isNotEmpty) {
      if (selectedDates.length > 1) {
        final firstDate = selectedDates.first!;
        final lastDate = selectedDates.last!;
        final differenceInDays = lastDate.difference(firstDate).inDays;
        if (differenceInDays > 3) {
          AnimatedSnackBar.material(
            'Vous ne pouvez pas sélectionner plus de 4 jours.',
            type: AnimatedSnackBarType.error,
          ).show(context);
          return;
        }
      }
      setState(() {
        _selectedDates = selectedDates.cast<DateTime>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final boitiers = generateFakeBoitiers();
    final boitier = boitiers[widget.id! - 1];
    final formattedDate = DateFormat('yyyy/MM/dd kk:mm').format(boitier.date);
    final boitierTragets = BoitierTragetFakeData.generateFakeBoitierTragets();

    return Scaffold(
      body: Column(
        children: [
          BoitierHeader(
            boitier: boitier,
            formattedDate: formattedDate,
            onDateTap: _showDatePickerDialog,
            selectedDates: _displaySelectedDates(),
          ),
          // _buildHeader(boitier, formattedDate),
          RowTragetRapport(
            boitierTragets: boitierTragets,
            boitier: boitiers[widget.id! - 1],
            formattedDate: formattedDate,
            onDateTap: _showDatePickerDialog,
            selectedDates: _displaySelectedDates(),
          ),
        ],
      ),
    );
  }
}
