// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';

class ProviderAdminCentre with ChangeNotifier {
  bool _enregistrer_depense = false;
  bool _enregister_bierre = false;
  bool _enregister_credit = false;
  bool _enregister_produit = false;
  bool _enregister_materiel = false;
  bool _rechercher_historique = false;
  bool _approvisionner_petit_modele = false;
  bool _approvisionner_grand_modele = false;
  bool _approvisionner_credit = false;
  bool _approvisionner_tee_shirt = false;
  bool _approvisionner_produit = false;
  bool _mise_jour_produit = false;
  bool _mise_jour_tee_shirt = false;
  bool _mise_jour_credit = false;
  bool _mise_jour_petit_modele = false;
  bool _mise_jour_grand_modele = false;
  bool _initialiser = false;
  bool _init_bar = false;
  bool _stock_cumule = false;

  bool _enregister_perte = false;

  bool get perte {
    return _enregister_perte;
  }

  bool get initi_bar {
    return _init_bar;
  }

  void put_init_bar_false() {
    _init_bar = false;
    notifyListeners();
  }

  void put_init_bar_true() {
    _init_bar = true;
    notifyListeners();
  }

  bool get stock_cumule {
    return _stock_cumule;
  }

  bool get initialiser {
    return _initialiser;
  }

  bool get rechercher_historique {
    return _rechercher_historique;
  }

  bool get enregistrer_depense {
    return _enregistrer_depense;
  }

  bool get enregister_bierre {
    return _enregister_bierre;
  }

  bool get enregister_credit {
    return _enregister_credit;
  }

  bool get enregister_produit {
    return _enregister_produit;
  }

  bool get enregister_materiel {
    return _enregister_materiel;
  }

  bool get approvisionner_credit {
    return _approvisionner_credit;
  }

  bool get approvisionner_produit {
    return _approvisionner_produit;
  }

  bool get approvisionner_tee_shirt {
    return _approvisionner_tee_shirt;
  }

  bool get approvisionner_petit_modele {
    return _approvisionner_petit_modele;
  }

  bool get approvisionner_grand_modele {
    return _approvisionner_grand_modele;
  }

  bool get mise_jour_produit {
    return _mise_jour_produit;
  }

  bool get mise_jour_credit {
    return _mise_jour_credit;
  }

  bool get mise_jour_tee_shirt {
    return _mise_jour_tee_shirt;
  }

  bool get mise_jour_petit_modele {
    return _mise_jour_petit_modele;
  }

  bool get mise_jour_grand_modele {
    return _mise_jour_grand_modele;
  }

  void mise_jour_grand_modele_true() {
    _mise_jour_grand_modele = true;
    notifyListeners();
  }

  void mise_jour_grand_modele_false() {
    _mise_jour_grand_modele = false;
    notifyListeners();
  }

  void mise_jour_petit_modele_true() {
    _mise_jour_petit_modele = true;
    notifyListeners();
  }

  void mise_jour_petit_modele_false() {
    _mise_jour_petit_modele = false;
    notifyListeners();
  }

  void mise_jour_credit_true() {
    _mise_jour_credit = true;
    notifyListeners();
  }

  void mise_jour_credit_false() {
    _mise_jour_credit = false;
    notifyListeners();
  }

  void mise_jour_produit_true() {
    _mise_jour_produit = true;
    notifyListeners();
  }

  void mise_jour_produit_false() {
    _mise_jour_produit = false;
    notifyListeners();
  }

  void mise_jour_tee_shirt_true() {
    _mise_jour_tee_shirt = true;
    notifyListeners();
  }

  void mise_jour_tee_shirt_false() {
    _mise_jour_tee_shirt = false;
    notifyListeners();
  }

  void enregister_perte_true() {
    _enregister_perte = true;
    notifyListeners();
  }

  void enregister_perte_false() {
    _enregister_perte = false;
    notifyListeners();
  }

  void enregister_depense_true() {
    _enregistrer_depense = true;
    notifyListeners();
  }

  void enregister_depense_false() {
    _enregistrer_depense = false;
    notifyListeners();
  }

  void rechercher_historique_true() {
    _rechercher_historique = true;
    notifyListeners();
  }

  void rechercher_historique_false() {
    _rechercher_historique = false;
    notifyListeners();
  }

  void stock_cumule_true() {
    _stock_cumule = true;
    notifyListeners();
  }

  void stock_cumule_false() {
    _stock_cumule = false;
    notifyListeners();
  }

  void initialiser_true() {
    _initialiser = true;
    notifyListeners();
  }

  void initialiser_false() {
    _initialiser = false;
    notifyListeners();
  }

  void enregister_bierre_true() {
    _enregister_bierre = true;
    notifyListeners();
  }

  void enregister_bierre_false() {
    _enregister_bierre = false;
    notifyListeners();
  }

  void enregister_credit_true() {
    _enregister_credit = true;
    notifyListeners();
  }

  void enregister_credit_false() {
    _enregister_credit = false;
    notifyListeners();
  }

  void enregister_produit_true() {
    _enregister_produit = true;
    notifyListeners();
  }

  void enregister_produit_false() {
    _enregister_produit = false;
    notifyListeners();
  }

  void enregister_materiel_true() {
    _enregister_materiel = true;
    notifyListeners();
  }

  void enregister_materiel_false() {
    _enregister_materiel = false;
    notifyListeners();
  }

  void apprv_petit_model_true() {
    _approvisionner_petit_modele = true;
    notifyListeners();
  }

  void app_petit_model_false() {
    _approvisionner_petit_modele = false;
    notifyListeners();
  }

  void appro_grand_model_true() {
    _approvisionner_grand_modele = true;
    notifyListeners();
  }

  void appro_grand_model_false() {
    _approvisionner_grand_modele = false;
    notifyListeners();
  }

  void appro_tee_shirt_true() {
    _approvisionner_tee_shirt = true;
    notifyListeners();
  }

  void appro_tee_shirt_false() {
    _approvisionner_tee_shirt = false;
    notifyListeners();
  }

  void appro_credit_true() {
    _approvisionner_credit = true;
    notifyListeners();
  }

  void appro_credit_false() {
    _approvisionner_credit = false;
    notifyListeners();
  }

  void appro_produit_true() {
    _approvisionner_produit = true;
    notifyListeners();
  }

  void appro_produit_false() {
    _approvisionner_produit = false;
    notifyListeners();
  }
}
