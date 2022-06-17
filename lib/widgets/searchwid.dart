import 'package:flutter/material.dart';
import 'package:teaching_app/constants/app_colors.dart';
import 'package:teaching_app/constants/app_styles.dart';

class SearchWid extends StatelessWidget {
  const SearchWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.neutral1, borderRadius: BorderRadius.circular(100)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Icon(
          Icons.search_outlined,
          size: 24,
          color: AppColors.neutral2,
        ),
        const SizedBox(width: 18),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Поиск вакансии',
              hintStyle: AppStyles.s16w400.copyWith(
                color: AppColors.neutral2,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: const [
            SizedBox(
                height: 20,
                child: VerticalDivider(
                  thickness: 2,
                )),
            Icon(
              Icons.filter_list_alt,
              color: AppColors.neutral2,
            )
          ],
        ),
      ]),
    );
  }
}
