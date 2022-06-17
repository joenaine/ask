import 'package:flutter/material.dart';
import 'package:teaching_app/widgets/appdivider.dart';
import 'package:teaching_app/widgets/apply.dart';
import 'package:teaching_app/widgets/categories.dart';
import 'package:teaching_app/widgets/clear.dart';
import 'package:teaching_app/widgets/filterTitle.dart';
import 'package:teaching_app/widgets/filtertext.dart';

class BottomCategories extends StatelessWidget {
  const BottomCategories({
    Key? key,
    required this.cities,
    required this.categories,
  }) : super(key: key);

  final List<String> cities;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FilterTitleText(),
            const SizedBox(
              height: 20,
            ),
            CategoriesFilter(cities: cities),
            const AppDivider(),
            const FilterText(name: 'Категории'),
            CategoriesFilter(cities: categories),
            const SizedBox(
              height: 16,
            ),
            const ApplyWidget(),
            const ClearWidget()
          ],
        ),
      ),
    );
  }
}
