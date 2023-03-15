// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class providerDrawerAdminBar with ChangeNotifier {
  bool _centre_selected = true;
  bool _benefice_selected = false;
  bool _rubrique_selected = false;
  bool _statistique_generale = false;
  bool _statistique_journalier = false;
  bool _problemes = false;
  bool _depenses = false;
  bool _list_vente_credits = false;
  bool _liquidite_grand_modele = false;
  bool _liquidite_petit_modele = false;
  bool _approvisionnement_grand_modele = false;
  bool _approvisionnement_petit_modele = false;
  bool _list_grand_modele = false;
  bool _list_petit_modele = false;
  bool _nouvelle_bierre = false;
  bool _home = false;
  bool _enregistrer_materiel = false;
  bool _list_materiel = false;
  bool _list_pertes = false;
  bool _enregsitrer_depense = false;
  bool _historique = false;
  bool _initialise = false;
  bool _stock_cumule = false;
  bool _enregistre_perte = false;

  bool get enregistrer_perte {
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
    return _enregsitrer_depense;
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

  void put_enregistrer_depense() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = true;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_enregistrer_materiel() {
    _enregistrer_materiel = true;
    _list_materiel = false;
    _list_pertes = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
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
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
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
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  bool get home_selected {
    return _home;
  }

  void put_home_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _home = true;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_home_selected_false() {
    _home = false;
    notifyListeners();
  }

  bool get nouvelle_bierre_selected {
    return _nouvelle_bierre;
  }

  void put_nouvelle_bierre_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _nouvelle_bierre = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_nouvelle_bierre_selected_false() {
    _nouvelle_bierre = false;
    notifyListeners();
  }

  bool get list_petit_modele_selected {
    return _list_petit_modele;
  }

  void put_list_petit_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _list_petit_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_petit_modele_selected_false() {
    _list_petit_modele = false;
    notifyListeners();
  }

  bool get list_grand_modele_selected {
    return _list_grand_modele;
  }

  void put_list_grand_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _list_grand_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _enregsitrer_depense = false;
    _historique = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_grand_modele_selected_false() {
    _list_grand_modele = false;
    notifyListeners();
  }

  bool get approvisionnement_petit_modele_selected {
    return _approvisionnement_petit_modele;
  }

  void put_approvisionnement_petit_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _approvisionnement_petit_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _historique = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_approvisionnement_petit_modele_selected_false() {
    _approvisionnement_petit_modele = false;
    notifyListeners();
  }

  bool get approvisionnement_grand_modele_selected {
    return _approvisionnement_grand_modele;
  }

  void put_approvisionnement_grand_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _approvisionnement_grand_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_approvisionnement_grand_modele_selected_false() {
    _approvisionnement_grand_modele = false;
    notifyListeners();
  }

  bool get liquidite_petit_modele_selected {
    return _liquidite_petit_modele;
  }

  void put_liquidite_petit_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _liquidite_petit_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _enregsitrer_depense = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_liquidite_petit_modele_selected_false() {
    _liquidite_petit_modele = false;
    notifyListeners();
  }

  bool get liquidite_grand_modele_selected {
    return _liquidite_grand_modele;
  }

  void put_liquidite_grand_modele_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _liquidite_grand_modele = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _enregsitrer_depense = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_liquidite_grand_modele_selected_false() {
    _liquidite_grand_modele = false;
    notifyListeners();
  }

  bool get ventes_credits_selected {
    return _list_vente_credits;
  }

  void put_list_vente_credits_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _list_vente_credits = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _enregsitrer_depense = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_list_vente_credits_selected_false() {
    _list_vente_credits = false;
    notifyListeners();
  }

  bool get depenses_selected {
    return _depenses;
  }

  void put_depenses_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _depenses = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _enregsitrer_depense = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_depenses_selected_false() {
    _depenses = false;
    notifyListeners();
  }

  bool get problemes_selected {
    return _problemes;
  }

  void put_probleme_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _problemes = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _enregsitrer_depense = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_problemes_selected_false() {
    _problemes = false;
    notifyListeners();
  }

  bool get statistique_journalier_selected {
    return _statistique_journalier;
  }

  void put_statistique_journalier_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_journalier = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _enregsitrer_depense = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_statistique_journalier_selected_false() {
    _statistique_journalier = false;
    notifyListeners();
  }

  bool get centre_selected {
    return _centre_selected;
  }

  void put_centre_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _centre_selected = true;
    _home = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _enregsitrer_depense = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_centre_selected_false() {
    _centre_selected = false;
    notifyListeners();
  }

  bool get benefice_selected {
    return _benefice_selected;
  }

  void put_benefice_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _benefice_selected = true;
    _home = false;
    _centre_selected = false;
    _enregsitrer_depense = false;
    _rubrique_selected = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _initialise = false;
    _stock_cumule = false;
    _historique = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_benefice_selected_false() {
    _benefice_selected = false;
    notifyListeners();
  }

  bool get rubrique_selected {
    return _rubrique_selected;
  }

  void put_rubrique_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _rubrique_selected = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _enregsitrer_depense = false;
    _statistique_generale = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_rubrique_selected_false() {
    _rubrique_selected = false;
    notifyListeners();
  }

  bool get statistique_generale_selected {
    return _statistique_generale;
  }

  void put_statistique_generale_selected_true() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = true;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_historique() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = true;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_initialse() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = true;
    _stock_cumule = false;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_stock_cumule() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = true;
    _enregistre_perte = false;
    notifyListeners();
  }

  void put_enregstre_perte() {
    _enregistrer_materiel = false;
    _list_materiel = false;
    _list_pertes = false;
    _statistique_generale = false;
    _home = false;
    _centre_selected = false;
    _benefice_selected = false;
    _rubrique_selected = false;
    _enregsitrer_depense = false;
    _statistique_journalier = false;
    _problemes = false;
    _depenses = false;
    _list_vente_credits = false;
    _liquidite_grand_modele = false;
    _liquidite_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _approvisionnement_petit_modele = false;
    _list_grand_modele = false;
    _list_petit_modele = false;
    _nouvelle_bierre = false;
    _historique = false;
    _initialise = false;
    _stock_cumule = false;
    _enregistre_perte = true;
    notifyListeners();
  }
}
