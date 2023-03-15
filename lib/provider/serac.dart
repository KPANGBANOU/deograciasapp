// ignore_for_file: dead_code, prefer_final_fields, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';

class Search extends ChangeNotifier {
  bool _afficche = false;
  String _search = "";
  String _type_bierre = "Pétit modèle";
  String _nom_produit = "";
  int _seuil = 0;
  int _prix_achat = 0;
  int _prix_vente = 0;
  String _user_nom = "0";
  String _user_prenom = "";
  String _user_telephone = "";
  String _user_email = "";
  String _initiale_name = "";
  int _current_index = 1;

  int get current_index {
    return _current_index;
  }

  void change_current_index(int value) {
    _current_index = value;
    notifyListeners();
  }

  String get initiale_name {
    return _initiale_name;
  }

  void change_initiale_name(String value) {
    _initiale_name = value;
    notifyListeners();
  }

  int get prix_achat {
    return _prix_achat;
  }

  void change_prix_achat(String value) {
    _prix_achat = value.isNotEmpty ? int.parse(value) : 0;
    notifyListeners();
  }

  int get prix_vente {
    return _prix_vente;
  }

  void change_prix_vente(String value) {
    _prix_vente = value.isNotEmpty ? int.parse(value) : 0;
    notifyListeners();
  }

  String get nom_produit {
    return _nom_produit;
  }

  void changenomproduit(String value) {
    _nom_produit = value;
    notifyListeners();
  }

  int get seuil_produit {
    return _seuil;
  }

  void change_seuil(String value) {
    _seuil = value.isNotEmpty ? int.parse(value) : 0;
    notifyListeners();
  }

  void changeseuil(String value) {
    _search = value;
    notifyListeners();
  }

  String get bierre {
    return _type_bierre;
  }

  void changebierre(String value) {
    _type_bierre = value;
    notifyListeners();
  }

  void putfalse() {
    _afficche = false;
    notifyListeners();
  }

  String get searchvalue {
    return _search;
  }

  void puttrue() {
    _afficche = true;
    notifyListeners();
  }

  void rechercher(String value) {
    _search = value;
    notifyListeners();
  }

  bool get val {
    return _afficche;
  }

  void afficher() {
    _afficche = !_afficche;
    notifyListeners();
  }
}
