import 'package:fleet_watcher_mobile/models/boitier.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoitierHeader extends StatelessWidget {
  final Boitier? boitier;
  final String? formattedDate;
  final VoidCallback? onDateTap;
  final String? selectedDates;
  final bool isCenter;
  final bool isRapport;

  const BoitierHeader({
    super.key,
    this.boitier,
    this.formattedDate,
    this.onDateTap,
    this.selectedDates,
    this.isCenter = false,
    this.isRapport = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 4,
          child: Column(
            children: [
              Container(
                color: MyColors.primary,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(FSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isRapport)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(boitier!.immatriculation,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const Gap(FSizes.sm),
                              Text(formattedDate!,
                                  style: const TextStyle(
                                      fontSize: 15, color: MyColors.darkGrey)),
                            ],
                          ),
                          const Gap(FSizes.xs),
                          Text(boitier!.adresse,
                              style: const TextStyle(
                                  fontSize: 15, color: MyColors.darkGrey)),
                          Text(
                              "Vitesse ${boitier!.vitesse}. Carburant ${boitier!.carburant}",
                              style: const TextStyle(
                                  fontSize: 15, color: MyColors.darkGrey)),
                          const Gap(FSizes.xs),
                          Text(boitier!.conduteurName,
                              style: const TextStyle(
                                  fontSize: 15, color: MyColors.darkGrey)),
                          const Divider(),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(boitier!.immatriculation,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const Gap(FSizes.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(formattedDate!,
                                  style: const TextStyle(
                                      fontSize: 15, color: MyColors.darkGrey)),
                              Text(
                                  " ,Vitesse ${boitier!.vitesse}. Carburant ${boitier!.carburant}",
                                  style: const TextStyle(
                                      fontSize: 15, color: MyColors.darkGrey)),
                            ],
                          ),
                          const Gap(FSizes.xs),
                          Text(boitier!.adresse,
                              style: const TextStyle(
                                  fontSize: 15, color: MyColors.darkGrey)),
                          const Gap(FSizes.xs),
                          Text(boitier!.conduteurName,
                              style: const TextStyle(
                                  fontSize: 15, color: MyColors.darkGrey)),
                          const Divider(),
                          const Text(
                            "Just a Title For Describe What Going On",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Gap(FSizes.spaceBtwItm),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: FSizes.defaultSpace),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconAndColumnInfo(
                                      title: "15Km/h",
                                      subTitle: "Vitesse max",
                                      icon: Icons.speed_rounded,
                                    ),
                                    IconAndColumnInfo(
                                      title: "15Km/h",
                                      subTitle: "Vitesse moy",
                                      icon: Icons.speed_rounded,
                                    ),
                                  ],
                                ),
                                Gap(FSizes.spaceBtwItm),
                                Row(
                                  children: [
                                    IconAndColumnInfo(
                                      title: "15Km/h",
                                      subTitle: "Temps conduite",
                                      icon: CupertinoIcons.stopwatch,
                                    ),
                                    IconAndColumnInfo(
                                        title: "15Km/h",
                                        subTitle: "Temps d'arret",
                                        icon: CupertinoIcons.stopwatch),
                                  ],
                                ),
                                Gap(FSizes.defaultSpace),
                                Divider(),
                              ],
                            ),
                          ),
                          const Gap(FSizes.sm)
                        ],
                      ),
                    GestureDetector(
                      onTap: onDateTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: MyColors.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDates!,
                              style: const TextStyle(
                                  fontSize: 16, color: MyColors.darkGrey),
                            ),
                            const Icon(Icons.calendar_today,
                                color: MyColors.primary),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: MyColors.grey,
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: MyColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IconAndColumnInfo extends StatelessWidget {
  const IconAndColumnInfo({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const Gap(FSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(subTitle,
                  style:
                      const TextStyle(fontSize: 14, color: MyColors.darkGrey)),
            ],
          ),
        ],
      ),
    );
  }
}
