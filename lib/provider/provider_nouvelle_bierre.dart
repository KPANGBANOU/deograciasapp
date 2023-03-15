// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderNouvelleBierre with ChangeNotifier {
  String _type = "Grand modèle";

  bool _affiche = false;
  String _nom = "";
  String _quantite_initial = "";
  String _prix_unitaire_caht = "";
  String _prix_unitaire_vente = "";
  String _seuil_approvisionnement = "";

  String get type {
    return _type;
  }

  bool get affiche {
    return _affiche;
  }

  String get nom {
    return _nom;
  }

  String get quantite_initial {
    return _quantite_initial;
  }

  String get prix_unitaire_achat {
    return _prix_unitaire_caht;
  }

  String get prix_unitaire_vente {
    return _prix_unitaire_vente;
  }

  String get seuil_approvisionnement {
    return _seuil_approvisionnement;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void change_type(String? value) {
    _type = value!;
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

  void change_quantite_initial(String? value) {
    _quantite_initial = value!;
    notifyListeners();
  }

  void change_prix_unitaire_achat(String? value) {
    _prix_unitaire_caht = value!;
    notifyListeners();
  }

  void change_prix_unitaire_vente(String? value) {
    _prix_unitaire_vente = value!;
    notifyListeners();
  }

  void change_seuil_approvisionnement(String? value) {
    _seuil_approvisionnement = value!;
    notifyListeners();
  }
}
