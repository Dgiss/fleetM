import 'package:get/get_navigation/get_navigation.dart';

class LanguageTranslate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr_FR': {
          'loginInput': "Entrez votre nom d'utilisateur",
          'passInput': "Entrez votre mot de passe",
          'btnConnecter': "Connexion",
          'userNameError': "Le nom d'utilisateur est requis",
          'passError': "Le mot de passe est requis",
          'errorMessage': "Nom d'utilisateur ou mot de passe incorrect",
          'btnCommencez': "Commencez",
          'titleOnBoarding1': "Localisation",
          'subTitleOnBoarding1':
              "Suivez en temps réel l'emplacement de vos véhicules grâce à un système de géolocalisation avancé",
          'titleOnBoarding2': "Historique des trajets",
          'subTitleOnBoarding2':
              "Enregistrement détaillé des trajets effectués, Dates, heures, distances parcourues et itinéraires empruntés",
          'titleOnBoarding3': "Notification",
          'subTitleOnBoarding3':
              "Recevez des notifications en temps réel pour rester connecté à votre équipe",
          'skip': "Passer"
        },
        'en_US': {
          'loginInput': "Enter your username",
          'passInput': "Enter your password",
          'btnConnecter': "Login",
          'userNameError': "Username is required",
          'passError': "Username is required",
          'errorMessage': "Incorrect username or password",
          'btnCommencez': "Get Started",
          'titleOnBoarding1': "Location",
          'subTitleOnBoarding1':
              "Track the real-time location of your vehicles with advanced geolocation",
          'titleOnBoarding2': "Trip History",
          'subTitleOnBoarding2':
              "Detailed records of completed trips, including dates, times, distances, and routes taken",
          'titleOnBoarding3': "Notification",
          'subTitleOnBoarding3':
              "Receive real-time notifications to stay connected with your team",
          'skip': "Skip"
        },
      };
}
//lors de l'aappel appeler "title".tr