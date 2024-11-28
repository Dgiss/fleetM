class Boitier {
  final int id;
  final String immatriculation;
  final String adresse;
  final String conduteurName;
  final String vitesse;
  final String carburant;
  final bool etat;
  final DateTime date = DateTime.now();
  Boitier(this.immatriculation, this.adresse, this.conduteurName, this.vitesse,
      this.carburant, this.id, this.etat);
}
