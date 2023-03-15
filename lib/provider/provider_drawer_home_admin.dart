// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class providerAdminDrawerHome with ChangeNotifier {
  bool _bar_selected = false;
  bool _centre_selected = true;
  bool _comptabilite_selected = false;
  bool _list_employe_selected = false;
  bool _attribution_droits_selected = false;
  bool _parametre_selected = false;

  bool get bar_selected {
    return _bar_selected;
  }

  void put_bar_selection_true() {
    _bar_selected = true;
    _centre_selected = false;
    _comptabilite_selected = false;
    _list_employe_selected = false;
    _attribution_droits_selected = false;
    _parametre_selected = false;
    notifyListeners();
  }

  void put_bar_selection_false() {
    _bar_selected = false;
    notifyListeners();
  }

  bool get centre_selected {
    return _centre_selected;
  }

  void put_centre_selection_true() {
    _centre_selected = true;
    _bar_selected = false;

    _comptabilite_selected = false;
    _list_employe_selected = false;
    _attribution_droits_selected = false;
    _parametre_selected = false;
    notifyListeners();
  }

  void put_centre_selection_false() {
    _centre_selected = false;
    notifyListeners();
  }

  bool get comptabilite_selected {
    return _comptabilite_selected;
  }

  void put_comptabilite_selection_true() {
    _comptabilite_selected = true;
    _bar_selected = false;
    _centre_selected = false;

    _list_employe_selected = false;
    _attribution_droits_selected = false;
    _parametre_selected = false;
    notifyListeners();
  }

  void put_comptabilite_selection_false() {
    _comptabilite_selected = false;
    notifyListeners();
  }

  bool get list_employes_selected {
    return _list_employe_selected;
  }

  void put_list_employe_selection_true() {
    _list_employe_selected = true;
    _bar_selected = false;
    _centre_selected = false;
    _comptabilite_selected = false;

    _attribution_droits_selected = false;
    _parametre_selected = false;
    notifyListeners();
  }

  void put_list_employe_selection_false() {
    _list_employe_selected = false;
    notifyListeners();
  }

  bool get attribution_droiits_selected {
    return _attribution_droits_selected;
  }

  void put_attribution_droits_selection_true() {
    _attribution_droits_selected = true;
    _bar_selected = false;
    _centre_selected = false;
    _comptabilite_selected = false;
    _list_employe_selected = false;

    _parametre_selected = false;
    notifyListeners();
  }

  void put_attribution_droits_selection_false() {
    _attribution_droits_selected = false;
    notifyListeners();
  }

  bool get parametre_selected {
    return _parametre_selected;
  }

  void put_parametre_selection_true() {
    _parametre_selected = true;
    _bar_selected = false;
    _centre_selected = false;
    _comptabilite_selected = false;
    _list_employe_selected = false;
    _attribution_droits_selected = false;

    notifyListeners();
  }

  void put_parametre_selection_false() {
    _parametre_selected = false;
    notifyListeners();
  }
}
