// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';

class providerCreerCompte with ChangeNotifier {
  String _url = "";
  String _sexe = "Masculin";
  String _nom = "";
  String _prenom = "";
  String _date_naissance = "";
  String _email = "";
  String _telephone = "";
  String _password = "";
  String _password_confirmation = "";
  bool _is_password = true;
  bool _is_confirm = true;

  String get url {
    return _url;
  }

  void change_url(String value) {
    _url = value;
    notifyListeners();
  }

  String get nom {
    return _nom;
  }

  String get prenom {
    return _prenom;
  }

  String get telephone {
    return _telephone;
  }

  String get sexe {
    return _sexe;
  }

  String get date_naissance {
    return _date_naissance;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String get password_confirm {
    return _password_confirmation;
  }

  bool get is_password {
    return _is_password;
  }

  bool get is_confirm {
    return _is_confirm;
  }

  void change_sexe(String value) {
    _sexe = value;
    notifyListeners();
  }

  void change_nom(String value, TextEditingController nom_user) {
    _nom = value;
    nom_user.value = TextEditingValue(
        text: value.toUpperCase(), selection: nom_user.selection);
    notifyListeners();
  }

  void change_prenom(String value, TextEditingController prenom_user) {
    prenom_user.value = TextEditingValue(
        text: value.toUpperCase(), selection: prenom_user.selection);
    _prenom = value;
    notifyListeners();
  }

  void change_email(String value) {
    _email = value;
    notifyListeners();
  }

  void change_password(String value) {
    _password = value.trim();
    notifyListeners();
  }

  void change_password_confirmation(String value) {
    _password_confirmation = value.trim();
    notifyListeners();
  }

  void change_telephone(String value) {
    _telephone = value;
    notifyListeners();
  }

  void change_date_naissance(String value) {
    _date_naissance = value;
    notifyListeners();
  }

  void change_is_assword() {
    _is_password = !is_password;
    notifyListeners();
  }

  void change_is_confirm() {
    _is_confirm = !is_confirm;
    notifyListeners();
  }
}
