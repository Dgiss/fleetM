import 'package:fleet_watcher_mobile/features/home/screens/boitier_rapport.dart';
import 'package:fleet_watcher_mobile/models/boitier.dart';
import 'package:fleet_watcher_mobile/models/boitier_traget.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RowTragetRapport extends StatelessWidget {
  const RowTragetRapport({
    super.key,
    required this.boitierTragets,
    this.boitier,
    this.formattedDate,
    this.onDateTap,
    this.selectedDates,
    this.isSelected = true,
  });

  final List<BoitierTraget> boitierTragets;
  final Boitier? boitier;
  final String? formattedDate;
  final VoidCallback? onDateTap;
  final String? selectedDates;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: boitierTragets.length,
        itemBuilder: (context, index) {
          final trajet = boitierTragets[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => isSelected
                      ? HelperFuctions.navigateToScreen(
                          context,
                          BoitierRapport(
                            formattedDate: formattedDate!,
                            boitier: boitier!,
                            onDateTap: onDateTap!,
                            selectedDates: selectedDates!,
                          ))
                      : null,
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: MyColors.white),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: MyColors.primary,
                              ),
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: MyColors.white,
                              ),
                            ),
                            const Gap(FSizes.md),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dèpart: ${trajet.heureDepart}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    trajet.adressDepart,
                                    style: const TextStyle(
                                        fontSize: 16, color: MyColors.darkGrey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(FSizes.defaultSpace),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Arrivée: ${trajet.heureArrive}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    trajet.adressArrive,
                                    style: const TextStyle(
                                        fontSize: 16, color: MyColors.darkGrey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                const Gap(FSizes.spaceBtwItm),
              ],
            ),
          );
        },
      ),
    );
  }
}
