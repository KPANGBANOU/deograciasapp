// ignore_for_file: camel_case_types, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';

class providerServantCentre with ChangeNotifier {
  bool _vente_produit = false;
  bool _vente_tee_shirt = false;
  bool _vente_credut = true;
  bool _enregistrer_depense = false;
  bool _signaler_probleme = false;
  bool _entregistrer_credit_client = false;
  bool _statistique_journalier = false;
  bool _vente_list_credits = false;
  bool _depenses_enregistres = false;
  bool _problemes_enregistres = false;
  bool _parametres = false;
  bool _enregistrer_perte = false;
  bool _signaler_materiel = false;

  bool get vente_produit {
    return _vente_produit;
  }

  bool get enregistrer_perte {
    return _enregistrer_perte;
  }

  bool get signaler_materiel {
    return _signaler_materiel;
  }

  void put_enregistrer_perte() {
    _enregistrer_perte = true;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  void put_signaler_materiel() {
    _enregistrer_perte = false;
    _signaler_materiel = true;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  void put_vente_produit_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = true;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get vente_tee_shirt {
    return _vente_tee_shirt;
  }

  void put_vente_tee_shirt_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = true;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get vente_credit {
    return _vente_credut;
  }

  void put_vente_credit_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = true;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get enregistrer_depense {
    return _enregistrer_depense;
  }

  void put_enregistrer_depense_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = true;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get signaler_probleme {
    return _signaler_probleme;
  }

  void put_signaler_probleme_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = true;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get enregistrer_credit_client {
    return _entregistrer_credit_client;
  }

  void put_enregistrer_credit_vclien_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = true;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get statistique_journalier {
    return _statistique_journalier;
  }

  void put_statistique_journalier_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = true;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get vente_list_credits {
    return _vente_list_credits;
  }

  void put_vente_list_credits_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = true;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get parametres {
    return _parametres;
  }

  void put_parametres_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = true;
    _problemes_enregistres = false;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get problemes_enregistres {
    return _problemes_enregistres;
  }

  void put_problemes_enregistres_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = true;
    _depenses_enregistres = false;
    notifyListeners();
  }

  bool get depenses_enregistres {
    return _depenses_enregistres;
  }

  void put_depenses_enregistres_true() {
    _enregistrer_perte = false;
    _signaler_materiel = false;
    _vente_produit = false;
    _vente_credut = false;
    _vente_tee_shirt = false;
    _enregistrer_depense = false;
    _entregistrer_credit_client = false;
    _signaler_probleme = false;
    _statistique_journalier = false;
    _vente_list_credits = false;
    _parametres = false;
    _problemes_enregistres = false;
    _depenses_enregistres = true;
    notifyListeners();
  }
}
