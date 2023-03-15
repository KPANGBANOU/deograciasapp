// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderNouveauCredit with ChangeNotifier {
  bool _affiche = false;
  String _nom = "";
  String _montant_initial = "";
  String _benefice_sur_5000 = "";
  String _seuil_approvisionnement = "";

  bool get affiche {
    return _affiche;
  }

  String get nom {
    return _nom;
  }

  String get montant_initial {
    return _montant_initial;
  }

  String get benefice_sur_5000 {
    return _benefice_sur_5000;
  }

  String get seuil_approvisionnement {
    return _seuil_approvisionnement;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  void change_nom(String? value) {
    _nom = value!;
    notifyListeners();
  }

  void change_montant_initial(String? value) {
    _montant_initial = value!;
    notifyListeners();
  }

  void change_benefice_sur_5000(String? value) {
    _benefice_sur_5000 = value!;
    notifyListeners();
  }

  void change_seuil_approvisionnement(String? value) {
    _seuil_approvisionnement = value!;
    notifyListeners();
  }
}
