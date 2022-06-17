import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  int selectedIndexOfCity = 0;

  void onSelectedIndexOfCity(int index) {
    selectedIndexOfCity = index;
    notifyListeners();
  }
}
