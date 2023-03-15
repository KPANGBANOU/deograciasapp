// ignore_for_file: camel_case_types, prefer_final_fields, unused_field, non_constant_identifier_names

import 'package:flutter/foundation.dart';

class privileges with ChangeNotifier {
  String _role = "Servant";
  String _domaine = "Centre informatique";
  String _value = "Password";
  bool _val = false;
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

  bool get val {
    return _val;
  }

  void afficher() {
    _val = !_val;
    notifyListeners();
  }

  String get value {
    return _value;
  }

  void changevalue(String value) {
    _value = value;
    notifyListeners();
  }

  String get role {
    return _role;
  }

  String get domaine {
    return _domaine;
  }

  void changerole(String value) {
    _role = value;
    notifyListeners();
  }

  void changedomaine(String value) {
    _domaine = value;
    notifyListeners();
  }
}
