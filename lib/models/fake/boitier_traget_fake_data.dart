import 'dart:math';

import 'package:fleet_watcher_mobile/models/boitier_traget.dart';

class BoitierTragetFakeData {
  static List<BoitierTraget> generateFakeBoitierTragets() {
    List<BoitierTraget> boitierTragets = [];
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(const Duration(days: 1));
    DateTime dayBeforeYesterday = today.subtract(const Duration(days: 2));

    // Function to generate random times and addresses
    String randomTime() {
      int hour = Random().nextInt(24);
      int minute = Random().nextInt(60);
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    }

    String randomAddress() {
      List<String> addresses = [
        '123 Main Stghtfjyg bhgfy fycg',
        '456 Elm St',
        '789 Oak St',
        '101 Pine Ave',
        '202 Maple Dr',
        '303 Birch Blvd',
        '404 Cedar Rd',
        '505 Spruce Ct',
        '606 Willow Ln',
        '707 Chestnut Pl'
      ];
      return addresses[Random().nextInt(addresses.length)];
    }

    // Generate 10 entries for each date
    for (int i = 0; i < 10; i++) {
      boitierTragets.add(BoitierTraget(
        i,
        today,
        randomTime(),
        randomTime(),
        randomAddress(),
        randomAddress(),
      ));
      boitierTragets.add(BoitierTraget(
        i + 10,
        yesterday,
        randomTime(),
        randomTime(),
        randomAddress(),
        randomAddress(),
      ));
      boitierTragets.add(BoitierTraget(
        i + 20,
        dayBeforeYesterday,
        randomTime(),
        randomTime(),
        randomAddress(),
        randomAddress(),
      ));
    }

    return boitierTragets;
  }
}
