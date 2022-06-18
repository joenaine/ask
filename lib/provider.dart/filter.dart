import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  int selectedIndexOfCity = -1;
  String setFilter = 'Нет фильтров';

  void onSelectedIndexOfCity(int index) {
    selectedIndexOfCity = index;
    notifyListeners();
  }

  void setNewFilter(String text) {
    setFilter = text;
    notifyListeners();
  }
}
