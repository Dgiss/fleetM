import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trip {
  final String id;
  final String vehicleId;
  final DateTime startTime;
  final DateTime endTime;
  final String startLocation;
  final String endLocation;
  final double distance;
  final double averageSpeed;
  final int fuelConsumption;
  final List<LatLng> routePoints;

  Trip({
    required this.id,
    required this.vehicleId,
    required this.startTime,
    required this.endTime,
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.averageSpeed,
    required this.fuelConsumption,
    required this.routePoints,
  });

  static List<Trip> getDummyTrips(String vehicleId, DateTime startDate, DateTime endDate) {
    return [
      Trip(
        id: '1',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 8, 15),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 8, 47),
        startLocation: 'Rue des Champs, 75008 Paris',
        endLocation: '14 Rue de Montparnasse, 75006 Paris',
        distance: 12.5,
        averageSpeed: 45.0,
        fuelConsumption: 2,
        routePoints: [
          const LatLng(48.8737, 2.3064),
          const LatLng(48.8719, 2.3017),
          const LatLng(48.8658, 2.2958),
          const LatLng(48.8589, 2.2944),
          const LatLng(48.8534, 2.3037),
          const LatLng(48.8432, 2.3259),
        ],
      ),
      Trip(
        id: '2',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 9, 30),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 10, 15),
        startLocation: '14 Rue de Montparnasse, 75006 Paris',
        endLocation: 'Avenue des Ternes, 75017 Paris',
        distance: 8.7,
        averageSpeed: 35.0,
        fuelConsumption: 1,
        routePoints: [
          const LatLng(48.8432, 2.3259),
          const LatLng(48.8467, 2.3217),
          const LatLng(48.8509, 2.3159),
          const LatLng(48.8566, 2.3087),
          const LatLng(48.8614, 2.2955),
          const LatLng(48.8671, 2.2892),
        ],
      ),
      Trip(
        id: '3',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 11, 00),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 11, 45),
        startLocation: 'Avenue des Ternes, 75017 Paris',
        endLocation: 'Place de la Bastille, 75011 Paris',
        distance: 15.3,
        averageSpeed: 42.0,
        fuelConsumption: 3,
        routePoints: [
          const LatLng(48.8671, 2.2892),
          const LatLng(48.8702, 2.3003),
          const LatLng(48.8690, 2.3149),
          const LatLng(48.8656, 2.3353),
          const LatLng(48.8531, 2.3698),
          const LatLng(48.8534, 2.3688),
        ],
      ),
      Trip(
        id: '4',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 14, 00),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 14, 30),
        startLocation: 'Place de la Bastille, 75011 Paris',
        endLocation: 'Place de la République, 75003 Paris',
        distance: 6.8,
        averageSpeed: 38.0,
        fuelConsumption: 1,
        routePoints: [
          const LatLng(48.8534, 2.3688),
          const LatLng(48.8580, 2.3661),
          const LatLng(48.8625, 2.3645),
          const LatLng(48.8670, 2.3631),
          const LatLng(48.8673, 2.3628),
        ],
      ),
      Trip(
        id: '5',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 16, 15),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 17, 00),
        startLocation: 'Place de la République, 75003 Paris',
        endLocation: 'Gare Montparnasse, 75015 Paris',
        distance: 18.2,
        averageSpeed: 40.0,
        fuelConsumption: 4,
        routePoints: [
          const LatLng(48.8673, 2.3628),
          const LatLng(48.8651, 2.3543),
          const LatLng(48.8607, 2.3447),
          const LatLng(48.8563, 2.3351),
          const LatLng(48.8519, 2.3255),
          const LatLng(48.8421, 2.3219),
        ],
      ),
      Trip(
        id: '6',
        vehicleId: vehicleId,
        startTime: DateTime(startDate.year, startDate.month, startDate.day, 17, 30),
        endTime: DateTime(startDate.year, startDate.month, startDate.day, 18, 15),
        startLocation: 'Gare Montparnasse, 75015 Paris',
        endLocation: 'Rue des Champs, 75008 Paris',
        distance: 14.6,
        averageSpeed: 36.0,
        fuelConsumption: 3,
        routePoints: [
          const LatLng(48.8421, 2.3219),
          const LatLng(48.8476, 2.3198),
          const LatLng(48.8531, 2.3177),
          const LatLng(48.8586, 2.3156),
          const LatLng(48.8641, 2.3135),
          const LatLng(48.8737, 2.3064),
        ],
      ),
    ];
  }
}