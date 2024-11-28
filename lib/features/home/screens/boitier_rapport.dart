import 'package:fleet_watcher_mobile/features/home/widgets/boitier_header.dart';
import 'package:fleet_watcher_mobile/features/home/widgets/row_traget_rapport_widget.dart';
import 'package:fleet_watcher_mobile/models/boitier.dart';
import 'package:fleet_watcher_mobile/models/fake/boitier_traget_fake_data.dart';
import 'package:flutter/material.dart';

class BoitierRapport extends StatelessWidget {
  const BoitierRapport({
    super.key,
    this.boitier,
    this.formattedDate,
    this.onDateTap,
    this.selectedDates,
  });
  final String? formattedDate;
  final VoidCallback? onDateTap;
  final String? selectedDates;
  final Boitier? boitier;

  @override
  Widget build(BuildContext context) {
    final boitierTragets = BoitierTragetFakeData.generateFakeBoitierTragets();
    return Scaffold(
      body: Column(
        children: [
          BoitierHeader(
            boitier: boitier!,
            formattedDate: formattedDate!,
            onDateTap: onDateTap!,
            selectedDates: selectedDates!,
            isRapport: true,
          ),
          RowTragetRapport(
              boitierTragets: boitierTragets,
              boitier: boitier,
              formattedDate: formattedDate,
              onDateTap: onDateTap,
              selectedDates: selectedDates)
        ],
      ),
    );
  }
}
