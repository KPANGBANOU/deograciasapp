// ignore_for_file: camel_case_types, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class changeDateProvider with ChangeNotifier {
  int _during_premiere_date = 0;
  int _during_deuxieme_date = 0;
  bool _affiche = false;

  bool get affiche {
    return _affiche;
  }

  void affiche_false() {
    _affiche = false;
    notifyListeners();
  }

  void affiche_true() {
    _affiche = true;
    notifyListeners();
  }

  int get during_premiere_date {
    return _during_premiere_date;
  }

  int get during_deuxieme_date {
    return _during_deuxieme_date;
  }

  void change_during_premiere_date(date) {
    _during_premiere_date = date != null ? date.microsecondsSinceEpoch : 0;
    notifyListeners();
  }

  void change_during_deuxieme_date(date) {
    _during_deuxieme_date = date != null ? date.microsecondsSinceEpoch : 0;
    notifyListeners();
  }

  void change_premiere_date(date, TextEditingController control) {
    if (date != null) {
      String _premiere_date = DateFormat("yyyy-MM-dd").format(date);
      _premiere_date.isNotEmpty
          ? control.text = _premiere_date
          : control.text = "";
      notifyListeners();
    }
  }

  void change_mois(date, TextEditingController control) {
    String _premiere_date = DateFormat("yyyy-MM").format(date);
    _premiere_date.isNotEmpty
        ? control.text = _premiere_date
        : control.text = "";
    notifyListeners();
  }

  void change_annee(date, TextEditingController control) {
    String _premiere_date = DateFormat("yyyy").format(date);
    _premiere_date.isNotEmpty
        ? control.text = _premiere_date
        : control.text = "";
    notifyListeners();
  }
}
