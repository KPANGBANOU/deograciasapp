// ignore_for_file: non_constant_identifier_names, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class GerantDrawerProvider with ChangeNotifier {
  bool _rubrique_bar = true;
  bool _rubrique_centre = false;
  bool _statistique_bar = false;
  bool _statistique_centre = false;
  bool _liquidite_credit = false;
  bool _liquidite_produit = false;
  bool _liquidite_tee_shirt = false;
  bool _liquidite_petit_modele = false;
  bool _liquidite_grand_modele = false;
  bool _approvisionnement_credit = false;
  bool _approvisionnement_produit = false;
  bool _approvisionnement_tee_shirt = false;
  bool _approvsionnement_petit_modele = false;
  bool _approvisionnement_grand_modele = false;
  bool _list_produits = false;
  bool _list_credits = false;
  bool _list_tee_shirt = false;
  bool _list_petit_modele = false;
  bool _list_grand_modele = false;
  bool _nouveau_credit = false;
  bool _nouveau_produit = false;
  bool _nouvelle_bierre = false;
  bool _depense_centre = false;
  bool _depense_bar = false;
  bool _vente_centre = false;
  bool _vente_bar = false;
  bool _deconnexion = false;
  bool _parametres = false;
  bool _enregistrer_probleme = false;
  bool _enregistrer_depense = false;
  bool _enregistrer_perte = false;
  bool _problemes = false;
  bool _pertes = false;
  bool _depenses = false;
  bool _pertes_centre = false;
  bool _pertes_bar = false;
  bool _enregister_materiel_centre = false;
  bool _enregistrer_materiel_bar = false;
  bool _recharger_materiel_centre = false;
  bool _recharger_materiel_bar = false;
  bool _list_materiel_centre = false;
  bool _list_materiel_bar = false;
  bool _signaler_materiel_centre = false;
  bool _signaler_materiel_bar = false;
  bool _vente_credit = false;
  bool _vente_produit = false;
  bool _vente_tee_shirt = false;
  bool _vente_petit_modele = false;
  bool _vente_grand_modele = false;
  bool _ventes_bar = false;
  bool _ventes_centre = false;
  bool _enregister_vente_a_credits = false;

  bool get enregistrer_vente_a_credit {
    return _enregister_vente_a_credits;
  }

  bool get ventes_centre {
    return _ventes_centre;
  }

  bool get ventes_bar {
    return _ventes_bar;
  }

  bool get vente_credit {
    return _vente_credit;
  }

  bool get vente_produit {
    return _vente_produit;
  }

  bool get vente_tee_shirt {
    return _vente_tee_shirt;
  }

  bool get vente_petit_modele {
    return _vente_petit_modele;
  }

  bool get vente_grand_modele {
    return _vente_grand_modele;
  }

  bool get enregistrer_materiel_centre {
    return _enregister_materiel_centre;
  }

  bool get enregistrer_materiel_bar {
    return _enregistrer_materiel_bar;
  }

  bool get recharger_materiel_centre {
    return _recharger_materiel_centre;
  }

  bool get recharger_materiel_bar {
    return _recharger_materiel_bar;
  }

  bool get signaler_materiel_bar {
    return _signaler_materiel_bar;
  }

  bool get signaler_materiel_centre {
    return _signaler_materiel_centre;
  }

  bool get list_materiel_bar {
    return _list_materiel_bar;
  }

  bool get list_materiel_centre {
    return _list_materiel_centre;
  }

  bool get enregistrer_probleme {
    return _enregistrer_probleme;
  }

  bool get enregistrer_perte {
    return _enregistrer_perte;
  }

  bool get enregistrer_depense {
    return _enregistrer_depense;
  }

  bool get problemes {
    return _problemes;
  }

  bool get depenses {
    return _depenses;
  }

  bool get pertes_centre {
    return _pertes_centre;
  }

  bool get pertes_bar {
    return _pertes_bar;
  }

  bool get pertes {
    return _pertes;
  }

  bool get parametre {
    return _parametres;
  }

  void put_enregistrer_materiel_centre() {
    _enregister_materiel_centre = true;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_enregistrer_materiel_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = true;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_signaler_materiel_centre() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = true;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_signaler_materiel_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = true;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_list_materiel_centre() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = true;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_list_materiel_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = true;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_recharger_materiel_centre() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = true;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_recharger_materiel_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = true;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_enregistrer_depense() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = true;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_enregistrer_probleme() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = true;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_enregistrer_pertes() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = true;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_pertes() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = true;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_problemes() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = true;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_depenses() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = true;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_pertes_centre() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = true;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_pertes_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = true;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_parametre_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = true;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get rubrique_bar {
    return _rubrique_bar;
  }

  void put_rubrique_bar_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = true;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get rubrique_centre {
    return _rubrique_centre;
  }

  void put_rubrique_centre_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = true;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get statistique_bar {
    return _statistique_bar;
  }

  void put_statistique_bar_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = true;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get statistique_centre {
    return _statistique_centre;
  }

  void put_statistique_centre_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = true;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liquidite_credit {
    return _liquidite_credit;
  }

  void put_liquidite_credit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = true;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liquidite_produit {
    return _liquidite_produit;
  }

  void put_liquidite_produit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = true;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liquidite_tee_shirt {
    return _liquidite_tee_shirt;
  }

  void put_liquidite_tee_shirt_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = true;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liquidite_petit_modele {
    return _liquidite_petit_modele;
  }

  void put_liquidite_petit_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = true;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liquidite_grand_modele {
    return _liquidite_grand_modele;
  }

  void put_liquidite_grand_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = true;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get approvisionnement_credit {
    return _approvisionnement_credit;
  }

  void put_approvisionnement_credit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = true;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get approvisionnement_produit {
    return _approvisionnement_produit;
  }

  void put_approvisionnement_produit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = true;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get approvisionnement_tee_shirt {
    return _approvisionnement_tee_shirt;
  }

  void put_approvisionnement_tee_shirt_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = true;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get approvisionnement_petit_modele {
    return _approvsionnement_petit_modele;
  }

  void put_approvisionnement_petit_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = true;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get approvisionnement_grand_modele {
    return _approvisionnement_grand_modele;
  }

  void put_approvisionnement_grand_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = true;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get liste_credits {
    return _list_credits;
  }

  void put_list_credits_true_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = true;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get list_produits {
    return _list_produits;
  }

  void put_list_produits_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = true;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get list_tee_shirt {
    return _list_tee_shirt;
  }

  void put_list_tee_shirt_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = true;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get list_petit_modele {
    return _list_petit_modele;
  }

  void put_list_petit_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = true;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get list_grand_modele {
    return _list_grand_modele;
  }

  void put_list_grand_modele_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = true;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get nouveau_credit {
    return _nouveau_credit;
  }

  void put_nouveau_credit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = true;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get nouveau_produit {
    return _nouveau_produit;
  }

  void put_nouveau_produit_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = true;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get nouveau_bierre {
    return _nouvelle_bierre;
  }

  void put_nouveau_bierre_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = true;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get depense_centre {
    return _depense_centre;
  }

  void put_depense_centre_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = true;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get depense_bar {
    return _depense_bar;
  }

  void put_depense_bar_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = true;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get vente_bar {
    return _vente_bar;
  }

  void put_vente_bar_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = true;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get vente_centre {
    return _vente_centre;
  }

  void put_vente_centre_true() {
    _enregistrer_depense = false;
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = true;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  bool get deconnexion {
    return _deconnexion;
  }

  void put_deconnexion_true() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = true;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_vente_credit() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = true;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_vente_produit() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = true;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_vente_tee_shirt() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = true;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_vente_petit_modele() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = true;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void put_vente_grand_modele() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = true;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void Ventes_bar() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = true;
    _ventes_centre = false;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void Ventes_centre() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = true;
    _enregister_vente_a_credits = false;
    notifyListeners();
  }

  void Enregister_vente_a_credit() {
    _enregister_materiel_centre = false;
    _enregistrer_materiel_bar = false;
    _signaler_materiel_bar = false;
    _signaler_materiel_centre = false;
    _list_materiel_bar = false;
    _list_materiel_centre = false;
    _recharger_materiel_bar = false;
    _recharger_materiel_centre = false;
    _enregistrer_depense = false;
    _enregistrer_perte = false;
    _enregistrer_probleme = false;
    _pertes = false;
    _problemes = false;
    _depenses = false;
    _pertes_bar = false;
    _pertes_centre = false;
    _parametres = false;
    _rubrique_bar = false;
    _rubrique_centre = false;
    _statistique_bar = false;
    _statistique_centre = false;
    _liquidite_credit = false;
    _liquidite_produit = false;
    _liquidite_tee_shirt = false;
    _liquidite_petit_modele = false;
    _liquidite_grand_modele = false;
    _approvisionnement_credit = false;
    _approvisionnement_produit = false;
    _approvisionnement_tee_shirt = false;
    _approvsionnement_petit_modele = false;
    _approvisionnement_grand_modele = false;
    _list_produits = false;
    _list_credits = false;
    _list_tee_shirt = false;
    _list_petit_modele = false;
    _list_grand_modele = false;
    _nouveau_credit = false;
    _nouveau_produit = false;
    _nouvelle_bierre = false;
    _depense_centre = false;
    _depense_bar = false;
    _vente_centre = false;
    _vente_bar = false;
    _deconnexion = false;
    _vente_credit = false;
    _vente_produit = false;
    _vente_tee_shirt = false;
    _vente_petit_modele = false;
    _vente_grand_modele = false;
    _ventes_bar = false;
    _ventes_centre = false;
    _enregister_vente_a_credits = true;
    notifyListeners();
  }
}
