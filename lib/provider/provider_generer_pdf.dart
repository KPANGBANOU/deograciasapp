// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

class GenererPdf with ChangeNotifier {
  bool _generer_rubrique_bar = false;
  bool _generer_rubrique_cumule_bar = false;
  bool _generer_rubrique_centre = false;
  bool _generer_rubrique_cumule_centre = false;
  bool _generer_rubrique2 = false;
  bool _generer_rubrique_cumule2 = false;

  bool get generer_rubrique_bar {
    return _generer_rubrique_bar;
  }

  bool get generer_rubrique_cumule_bar {
    return _generer_rubrique_cumule_bar;
  }

  bool get generer_rubrique_centre {
    return _generer_rubrique_centre;
  }

  bool get generer_rubrique_cumule_centre {
    return _generer_rubrique_cumule_centre;
  }

  bool get generer_rubrique2 {
    return _generer_rubrique2;
  }

  bool get generer_rubrique_cumule2 {
    return _generer_rubrique_cumule2;
  }

  void rubrique_bar_true() {
    _generer_rubrique_bar = true;
    notifyListeners();
  }

  void rubrique_bar_false() {
    _generer_rubrique_bar = false;
    notifyListeners();
  }

  void rubrique_cumule_bar_true() {
    _generer_rubrique_cumule_bar = true;
    notifyListeners();
  }

  void rubrique_cumule_bar_false() {
    _generer_rubrique_cumule_bar = false;
    notifyListeners();
  }

  void rubrique_centre_true() {
    _generer_rubrique_centre = true;
    notifyListeners();
  }

  void rubrique_centre_false() {
    _generer_rubrique_centre = false;
    notifyListeners();
  }

  void rubrique_cumule2_true() {
    _generer_rubrique_cumule2 = true;
    notifyListeners();
  }

  void rubrique_cumule2_false() {
    _generer_rubrique_cumule2 = false;
    notifyListeners();
  }
}
