import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/provider.dart/filter.dart';

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({
    Key? key,
    required this.cities,
  }) : super(key: key);

  final List<String> cities;

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 6,
        runSpacing: 12,
        runAlignment: WrapAlignment.start,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(
            widget.cities.length,
            (index) => IntrinsicWidth(
                  child: GestureDetector(
                    onTap: () {
                      filterProvider.selectedIndexOfCity = index;
                      setState(() {});
                    },
                    child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: index == filterProvider.selectedIndexOfCity
                                ? greenLight
                                : greenTint1,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          widget.cities[index],
                          style: TextStyle(
                              color: index == filterProvider.selectedIndexOfCity
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                )),
      ),
    );
  }
}
