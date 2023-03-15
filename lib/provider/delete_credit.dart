// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';

class DeleteCredit with ChangeNotifier {
  bool _onpressed = false;
  bool get onPressed {
    return _onpressed;
  }

  void is_presed() {
    _onpressed = !_onpressed;
    notifyListeners();
  }

  void onLongPressedProvider(Map<int, bool> Flag, int index, bool is_select) {
    Flag[index] = !is_select;
    notifyListeners();
  }

  void is_pressed_false() {
    _onpressed = false;
    notifyListeners();
  }
}
