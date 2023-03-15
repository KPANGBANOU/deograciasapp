// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class providerDrawerAdminCenter with ChangeNotifier {
  bool _nouveau_credit = false;
  bool _bar_selected = true;
  bool _benefice_selected = false;
  bool _rubrique_selected = false;
  bool _statistique_generale = false;
  bool _statistique_journalier = false;
  bool _problemes = false;
  bool _depenses = false;
  bool _list_vente_credits = false;
  bool _liquidite_credit = false;
  bool _liquidite_produit = false;
  bool _liquidite_tee_shirt = false;
  bool _approvisionnement_credit = false;
  bool _approvisionnement_produit = false;
  bool _approvisionnement_tee_shirt = false;
  bool _list_produits = false;
  bool _list_credits = false;
  bool _list_tee_shirts = false;
  bool _nouveau_produit = false;
  bool _home = false;
  bool _enregistrer_materiel = false;
  bool _list_materiel = false;
  bool _list_pertes = false;
  bool _enregistrer_depense = false;
  bool _historique = false;
  bool _initialise = false;
  bool _stock_cumule = false;
  bool _enregistre_perte = false;

  bool get enregistre_perte {
    return _enregistre_perte;
  }

  bool get initialise {
    return _initialise;
  }

  bool get stock_cumule {
    return _stock_cumule;
  }

  bool get historique {
    return _historique;
  }

  bool get enregistrer_depense {
    return _enregistrer_depense;
  }

  bool get enregistrer_materiel {
    return _enregistrer_materiel;
  }

  bool get list_materiel {
    return _list_materiel;
  }

  bool get list_pertes {
    return _list_pertes;
  }

  void put_enregistrer_materiel() {
    _enregistrer_materiel = true;
    _list_materiel = false;
    _list_pertes = false;
    _home = false;
    _enregistrer_depense = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _historique = false;
    _bar_selected = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_materiel() {
    _enregistrer_materiel = false;
    _list_materiel = true;
    _list_pertes = false;
    _home = false;
    _enregistrer_depense = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_pertes() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = true;
    _home = false;
    _enregistrer_depense = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  bool get nouveau_credit_selected {
    return _nouveau_credit;
  }

  bool get nouveau_produit_selected {
    return _nouveau_produit;
  }

  bool get bar_selected {
    return _bar_selected;
  }

  bool get list_tee_shirts_selected {
    return _list_tee_shirts;
  }

  bool get list_produits_selected {
    return _list_produits;
  }

  bool get list_credits_selected {
    return _list_credits;
  }

  bool get approvisionnement_credit_selected {
    return _approvisionnement_credit;
  }

  bool get approvisionnement_produit {
    return _approvisionnement_produit;
  }

  bool get approvisionnement_tee_shirt {
    return _approvisionnement_tee_shirt;
  }

  bool get liquidite_tee_shirt {
    return _liquidite_tee_shirt;
  }

  bool get liquidite_produit {
    return _liquidite_produit;
  }

  bool get liquidite_credit {
    return _liquidite_credit;
  }

  bool get home_selected {
    return _home;
  }

  bool get problemes {
    return _problemes;
  }

  bool get depenses {
    return _depenses;
  }

  bool get vente_credits {
    return _list_vente_credits;
  }

  bool get benefice {
    return _benefice_selected;
  }

  bool get rubrique {
    return _rubrique_selected;
  }

  bool get statistique_generale {
    return _statistique_generale;
  }

  bool get statistique_journalier {
    return _statistique_journalier;
  }

  void put_home_selected_true() {
    _home = true;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_benefice_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = true;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_rubrique_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = true;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_statistique_generale_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = true;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_statistique_journalier_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = true;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_probleme_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = true;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_depense_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = true;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_vente_credits_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = true;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_nouveau_credit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = true;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_nouveau_produit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = true;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_approvisionnement_credit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = true;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_approvisionnement_produit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = true;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_approvisionnement_tee_shirt_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = true;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_liquidite_credit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = true;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_liquidite_produit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = true;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_liquidite_tee_shirt_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = true;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_credit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = true;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_produit_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = true;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_tee_shirt_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = true;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_bar_true() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = true;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_enregistrer_depense() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = true;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_historique() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = true;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_initialise() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = true;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_stock_cumule() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = true;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_enregistre_perte() {
    _home = false;
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _list_credits = false;
    _list_produits = false;
    _list_tee_shirts = false;
    _bar_selected = false;
    _enregistrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = true;
    notifyListeners();
  }
}
