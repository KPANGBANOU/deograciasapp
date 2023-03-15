// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProviderGestionGerant with ChangeNotifier {
  bool _enregsiter_probleme = false;
  bool _enregistrer_perte = false;
  bool f_enregistrer_bierre = false;
  bool _enregsiter_credit = false;
  bool _enregsiter_produit = false;
  bool _enregister_depense = false;
  bool _approvisionner_credit = false;
  bool _approvisionner_produit = false;
  bool _approvisionner_tee_shirt = false;
  bool _approvisionner_grand_modele = false;
  bool _approvisionner_petit_modele = false;
  bool _update_credit = false;
  bool _update_produit = false;
  bool _update_tee_shirt = false;
  bool _update_grand_modele = false;
  bool _update_petit_modele = false;
  bool _vente_credit = false;
  bool _vente_produit = false;
  bool _vente_tee_shirts = false;
  bool _vente_grand_modele = false;
  bool _vente_petit_modele = false;
  bool _recharger_materiel_centre = false;
  bool _recharger_materiel_bar = false;
  bool _signaler_materiel_centre = false;
  bool _signaler_materiel_bar = false;
  bool _enregister_materiel_bar = false;
  bool _enregister_materiel_centre = false;
  bool _password = false;

  bool get password {
    return _password;
  }

  void password_true() {
    _password = true;
    notifyListeners();
  }

  void password_false() {
    _password = false;
    notifyListeners();
  }

  bool get enregister_depense {
    return _enregister_depense;
  }

  void put_enregister_depense_true() {
    _enregister_depense = true;
    notifyListeners();
  }

  void put_enregister_depense_false() {
    _enregister_depense = false;
    notifyListeners();
  }

  bool get vente_grand_modele {
    return _vente_grand_modele;
  }

  void put_vente_grand_modele_true() {
    _vente_grand_modele = true;
    notifyListeners();
  }

  void put_vente_grand_modele_false() {
    _vente_grand_modele = false;
    notifyListeners();
  }

  bool get vente_petit_modele {
    return _vente_petit_modele;
  }

  void put_vente_petit_modele_true() {
    _vente_petit_modele = true;
    notifyListeners();
  }

  void put_vente_petit_modele_false() {
    _vente_petit_modele = false;
    notifyListeners();
  }

  bool get update_grand_modele {
    return _update_grand_modele;
  }

  void put_update_grand_modele_true() {
    _update_grand_modele = true;
    notifyListeners();
  }

  void put_update_grand_modele_false() {
    _update_grand_modele = false;
    notifyListeners();
  }

  bool get update_petit_modele {
    return _update_petit_modele;
  }

  void put_update_petit_modele_true() {
    _update_petit_modele = true;
    notifyListeners();
  }

  void put_update_petit_modele_false() {
    _update_petit_modele = false;
    notifyListeners();
  }

  bool get approvisionner_grand_modele {
    return _approvisionner_grand_modele;
  }

  void put_approvisionner_grand_modele_true() {
    _approvisionner_grand_modele = true;
    notifyListeners();
  }

  void put_approvisionner_grand_modele_false() {
    _approvisionner_grand_modele = false;
    notifyListeners();
  }

  bool get approvisionner_petit_modele {
    return _approvisionner_petit_modele;
  }

  void put_approvisionner_petit_modele_true() {
    _approvisionner_petit_modele = true;
    notifyListeners();
  }

  void put_approvisionner_petit_modele_false() {
    _approvisionner_petit_modele = false;
    notifyListeners();
  }

  bool get vente_tee_shirt {
    return _vente_tee_shirts;
  }

  void put_vente_tee_shirt_true() {
    _vente_tee_shirts = true;
    notifyListeners();
  }

  void put_vente_tee_shirt_false() {
    _vente_tee_shirts = false;
    notifyListeners();
  }

  bool get update_tee_shirt {
    return _update_tee_shirt;
  }

  void put_update_tee_shirt_true() {
    _update_tee_shirt = true;
    notifyListeners();
  }

  void put_update_tee_shirt_false() {
    _update_tee_shirt = false;
    notifyListeners();
  }

  bool get approvisionn_tee_shirt {
    return _approvisionner_tee_shirt;
  }

  void put_approvisionne_tee_shirt_true() {
    _approvisionner_tee_shirt = true;
    notifyListeners();
  }

  void put_approvisionne_tee_shirt_false() {
    _approvisionner_tee_shirt = false;
    notifyListeners();
  }

  bool get vente_produit {
    return _vente_produit;
  }

  void put_vente_produit_true() {
    _vente_produit = true;
    notifyListeners();
  }

  void put_vente_produit_false() {
    _vente_produit = false;
    notifyListeners();
  }

  bool get update_produit {
    return _update_produit;
  }

  void put_update_produit_true() {
    _update_produit = true;
    notifyListeners();
  }

  void put_update_produit_false() {
    _update_produit = false;
    notifyListeners();
  }

  bool get approvisionner_produit {
    return _approvisionner_produit;
  }

  void put_approvisionner_produit_true() {
    _approvisionner_produit = true;
    notifyListeners();
  }

  void put_approvisionner_produit_false() {
    _approvisionner_credit = false;
    notifyListeners();
  }

  bool get enregister_produit {
    return _enregsiter_produit;
  }

  void put_enregister_produit_true() {
    _enregsiter_produit = true;
    notifyListeners();
  }

  void put_enregister_produit_false() {
    _enregsiter_produit = false;
    notifyListeners();
  }

  bool get vente_credit {
    return _vente_credit;
  }

  void put_vente_credit_true() {
    _vente_credit = true;
    notifyListeners();
  }

  void put_vente_redit_false() {
    _vente_credit = false;
    notifyListeners();
  }

  bool get update_credit {
    return _update_credit;
  }

  void put_update_credit_true() {
    _update_credit = true;
    notifyListeners();
  }

  void put_update_credit_false() {
    _update_credit = false;
    notifyListeners();
  }

  bool get approvisionner_credit {
    return _approvisionner_credit;
  }

  void put_approvisionner_credit_true() {
    _approvisionner_credit = true;
    notifyListeners();
  }

  void put_approvisionner_credit_false() {
    _approvisionner_credit = false;
    notifyListeners();
  }

  bool get enregister_credit {
    return _enregsiter_credit;
  }

  void put_enregister_credit_true() {
    _enregsiter_credit = true;
    notifyListeners();
  }

  void put_enregister_credit_false() {
    _enregsiter_credit = false;
    notifyListeners();
  }

  bool get enregister_probleme {
    return _enregsiter_probleme;
  }

  void put_enregister_probleme_true() {
    _enregsiter_probleme = true;
    notifyListeners();
  }

  void put_enregister_probleme_false() {
    _enregsiter_probleme = false;
    notifyListeners();
  }

  bool get enregister_perte {
    return _enregistrer_perte;
  }

  void put_enregister_perte_true() {
    _enregistrer_perte = true;
    notifyListeners();
  }

  void put_enregister_perte_false() {
    _enregistrer_perte = false;
    notifyListeners();
  }

  bool get enregister_bierre {
    return f_enregistrer_bierre;
  }

  void put_enregister_bierre_true() {
    f_enregistrer_bierre = true;
    notifyListeners();
  }

  void put_enregister_bierre_false() {
    f_enregistrer_bierre = false;
    notifyListeners();
  }

  bool get enregister_materiel_centre {
    return _enregister_materiel_centre;
  }

  void put_enregister_materiel_centre_true() {
    _enregister_materiel_centre = true;
    notifyListeners();
  }

  void put_enregister_materiel_centre_false() {
    _enregister_materiel_centre = false;
    notifyListeners();
  }

  bool get enregister_materiel_bar {
    return _enregister_materiel_bar;
  }

  void put_enregister_materiel_bar_true() {
    _enregister_materiel_bar = true;
    notifyListeners();
  }

  void put_enregister_materiel_bar_false() {
    _enregister_materiel_bar = false;
    notifyListeners();
  }

  bool get recharger_materiel_bar {
    return _recharger_materiel_bar;
  }

  void put_recharger_materiel_bar_true() {
    _recharger_materiel_bar = true;
    notifyListeners();
  }

  void put_recharger_materiel_bar_false() {
    _recharger_materiel_bar = false;
    notifyListeners();
  }

  bool get recharger_materiel_centre {
    return _recharger_materiel_centre;
  }

  void put_recharger_materiel_centre_true() {
    _recharger_materiel_centre = true;
    notifyListeners();
  }

  void put_recharger_materiel_centre_false() {
    _recharger_materiel_centre = false;
    notifyListeners();
  }

  bool get signaler_materiel_bar {
    return _signaler_materiel_bar;
  }

  void put_signaler_materiel_bar_true() {
    _signaler_materiel_bar = true;
    notifyListeners();
  }

  void put_signaler_materiel_bar_false() {
    _signaler_materiel_bar = false;
    notifyListeners();
  }

  bool get signaler_materiel_centre {
    return _signaler_materiel_centre;
  }

  void put_signaler_materiel_centre_true() {
    _signaler_materiel_centre = true;
    notifyListeners();
  }

  void put_signaler_materiel_centre_false() {
    _signaler_materiel_centre = false;
    notifyListeners();
  }
}
