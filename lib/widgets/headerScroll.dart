import 'package:flutter/material.dart';
import 'package:teaching_app/constants/app_styles.dart';
import 'package:teaching_app/provider.dart/filter.dart';

class HeaderScroll extends StatelessWidget {
  const HeaderScroll({
    Key? key,
    required this.filterProvider,
  }) : super(key: key);

  final FilterProvider filterProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/wall-clock.png',
            height: 35,
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Фильтр', style: AppStyles.s16w500),
              Text(
                filterProvider.setFilter,
                style: AppStyles.s12w400,
              )
            ],
          ),
        ],
      ),
    );
  }
}
