import 'package:flutter/material.dart';
import 'package:teaching_app/config/colors_.dart';

class FilterText extends StatelessWidget {
  const FilterText({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
          fontSize: 16, color: greenDark, fontWeight: FontWeight.w500),
    );
  }
}
