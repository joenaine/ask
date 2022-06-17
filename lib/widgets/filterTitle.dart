import 'package:flutter/material.dart';
import 'package:teaching_app/config/colors_.dart';

class FilterTitleText extends StatelessWidget {
  const FilterTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Фильтр",
        style: TextStyle(
            fontSize: 17, color: greenDark, fontWeight: FontWeight.bold),
      ),
    );
  }
}
