// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderAjoutPhotocopie with ChangeNotifier {
  bool _affiche = false;
  String _nom = "";
  String _nombre_initial = "";
  String _seuil_approvisionnement = "";
  String _prix_unitaire = "";
  String _prix_unitaire_achat = "";

  bool get affiche {
    return _affiche;
  }

  String get nom {
    return _nom;
  }

  String get nombre_initial {
    return _nombre_initial;
  }

  String get seuil_approvisionnement {
    return _seuil_approvisionnement;
  }

  String get prix_unitaire {
    return _prix_unitaire;
  }

  String get prix_unitaire_achat {
    return _prix_unitaire_achat;
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

  void change_nombre_initial(String? value) {
    _nombre_initial = value!;
    notifyListeners();
  }

  void change_seuil_approvisionnement(String? value) {
    _seuil_approvisionnement = value!;
    notifyListeners();
  }

  void change_prix_achat(String? value) {
    _prix_unitaire = value!;
    notifyListeners();
  }

  void change_prix_unitaire_achat(String? value) {
    _prix_unitaire_achat = value!;
    notifyListeners();
  }
}
