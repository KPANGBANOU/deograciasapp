// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProviderAffiche with ChangeNotifier {
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
}
