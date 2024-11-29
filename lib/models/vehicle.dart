import 'package:google_maps_flutter/google_maps_flutter.dart';

class Vehicle {
  final String id;
  final String licensePlate;
  final String status;
  final LatLng location;
  final double speed;
  final int fuel;
  final String driverName;
  final String address;
  final DateTime lastUpdate;

  Vehicle({
    required this.id,
    required this.licensePlate,
    required this.status,
    required this.location,
    required this.speed,
    required this.fuel,
    required this.driverName,
    required this.address,
    required this.lastUpdate,
  });

  static List<Vehicle> dummyVehicles = [
    Vehicle(
      id: '1',
      licensePlate: 'CZ 619 ZG',
      status: 'En mouvement',
      location: const LatLng(48.8566, 2.3522),
      speed: 55,
      fuel: 75,
      driverName: 'Jean Dupont',
      address: '5 rue du professeur florian delbarre, 75015, paris',
      lastUpdate: DateTime.now(),
    ),
    Vehicle(
      id: '2',
      licensePlate: 'EX 771 GR',
      status: 'À l\'arrêt',
      location: const LatLng(48.8606, 2.3376),
      speed: 0,
      fuel: 45,
      driverName: 'Marie Martin',
      address: '14 Rue de Montparnasse, 75006 Paris',
      lastUpdate: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    Vehicle(
      id: '3',
      licensePlate: 'FH 992 QL',
      status: 'En mouvement',
      location: const LatLng(48.8496, 2.3452),
      speed: 45,
      fuel: 90,
      driverName: 'Pierre Bernard',
      address: '23 Avenue des Champs-Élysées, 75008 Paris',
      lastUpdate: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
  ];
}