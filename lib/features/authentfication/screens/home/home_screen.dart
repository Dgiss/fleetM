import 'package:fleet_watcher_mobile/features/home/screens/boitier_details_screen.dart';
import 'package:fleet_watcher_mobile/features/authentfication/screens/home/widgets/map_screen.dart';
import 'package:fleet_watcher_mobile/models/fake/fake_boitier_data.dart';
import 'package:fleet_watcher_mobile/utils/constants/colors.dart';
import 'package:fleet_watcher_mobile/utils/constants/sizes.dart';
import 'package:fleet_watcher_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:fleet_watcher_mobile/models/boitier.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  final ScrollController horizontalScrollController = ScrollController();
  bool isBoitierSelected = false;

  //apres lrsque j'aurais les infos en realtime
  // Stream<List<Boitier>> getRealTimeBoitierStream() {
  //   return Stream.periodic(
  //     const Duration(seconds: 2),
  //     (_) => generateFakeBoitiers(),
  //   );
  // }

  // Generate fake Boitiers
  List<Boitier> boitiers = generateFakeBoitiers();
  Boitier? selectedBoitier;
  @override
  void dispose() {
    sheetController.dispose();
    horizontalScrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedBoitier(int index) {
    // Largeur de chaque élément (ajustez si nécessaire)
    double itemWidth = HelperFuctions.screenWidth() * .7;
    // Calcule la position de défilement pour centrer l'élément sélectionné
    final double scrollOffset = index * itemWidth -
        (MediaQuery.of(context).size.width / 4) +
        (itemWidth / 7);

    horizontalScrollController.animateTo(
      scrollOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              const MapScreen(),
              GridView.builder(
                // controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: boitiers.length,
                itemBuilder: (context, index) {
                  final boitier = boitiers[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isBoitierSelected = true;
                        selectedBoitier = boitier;
                      });

                      Future.delayed(const Duration(milliseconds: 400), () {
                        _scrollToSelectedBoitier(index);
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: boitier.etat
                                ? const Color.fromARGB(255, 4, 31, 165)
                                : MyColors.darkGrey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.directions_car_outlined,
                            color: MyColors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          boitier.immatriculation,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          if (selectedBoitier != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                child: ListView.builder(
                  controller: horizontalScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: boitiers.length,
                  itemBuilder: (context, index) {
                    final boitier = boitiers[index];
                    return Container(
                      width: HelperFuctions.screenWidth() * .7,
                      child: CardInfosCar(
                        boitier: boitier,
                        onClose: () {
                          setState(() {
                            isBoitierSelected = false;
                            selectedBoitier = null;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          Visibility(
            visible: !isBoitierSelected,
            child: DraggableScrollableSheet(
              controller: sheetController,
              initialChildSize: .1,
              minChildSize: .0,
              maxChildSize: .8,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  //* la solution d'ajouter un item
                  //*pour le titre
                  //*pour ne pas  avoir le prob de swipe up :)

                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: boitiers.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                            bottom: FSizes.defaultSpace / 2,
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hintColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  height: 4,
                                  width: 40,
                                  margin: const EdgeInsets.only(bottom: 10),
                                ),
                              ),
                              const Text(
                                "20 Vehicules Trouver",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.primary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }
                      final boitier = boitiers[index - 1];
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: boitier.etat
                                      ? MyColors.primary
                                      : MyColors.darkGrey),
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: MyColors.white,
                              ),
                            ),
                            title: Text(
                              boitier.immatriculation,
                              style: const TextStyle(fontSize: 18),
                            ),
                            subtitle: Text(boitier.adresse),
                            onTap: () {
                              HelperFuctions.navigateToScreen(
                                context,
                                BoitierDetailsScreen(id: boitier.id),
                              );
                            },
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardInfosCar extends StatelessWidget {
  const CardInfosCar({
    super.key,
    required this.boitier,
    required this.onClose,
  });
  final Boitier boitier;
  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: Card(
            // color d'etat
            shadowColor: boitier.etat ? MyColors.darkSucess : MyColors.error,
            elevation: 10,
            margin: const EdgeInsets.all(19),
            child: Padding(
              padding: EdgeInsets.only(
                left: FSizes.md,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          const Icon(
                            Iconsax.car,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              height: 9,
                              width: 9,
                              decoration: BoxDecoration(
                                  color: boitier.etat
                                      ? MyColors.darkSucess
                                      : MyColors.error,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      IconButton(onPressed: onClose, icon: Icon(Icons.close))
                    ],
                  ),
                  Text(
                    boitier.immatriculation,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//avc streambuilder pour apres

/*

 builder: (BuildContext context, ScrollController scrollController) {
              return StreamBuilder<List<Boitier>>(
                stream: getRealTimeBoitierStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No vehicles found.'),
                    );
                  }

                  List<Boitier> boitiers = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: boitiers.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: FSizes.defaultSpace / 10,
                              bottom: FSizes.defaultSpace / 2,
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).hintColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    height: 4,
                                    width: 40,
                                    margin: const EdgeInsets.only(bottom: 10),
                                  ),
                                ),
                                Text(
                                  "${boitiers.length} Vehicules Trouver",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.primary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        }

                        final boitier = boitiers[index - 1];
                        return ListTile(
                          leading: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: boitier.etat
                                    ? MyColors.primary
                                    : MyColors.darkGrey),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: MyColors.white,
                            ),
                          ),
                          title: Text(boitier.immatriculation),
                          subtitle: Text(boitier.adresse),
                          onTap: () {
                            HelperFuctions.navigateToScreen(
                              context,
                              BoitierDetailsScreen(id: boitier.id),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),


*/
