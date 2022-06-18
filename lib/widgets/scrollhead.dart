import 'package:flutter/material.dart';
import 'package:teaching_app/constants/app_styles.dart';

class ScrollHead extends StatelessWidget {
  const ScrollHead({Key? key, required this.title, required this.icons})
      : super(key: key);
  final String title;
  final String icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(15),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(icons, height: 40),
          const SizedBox(
            height: 15,
          ),
          Flexible(
              child:
                  Text(title, style: AppStyles.s16w400.copyWith(fontSize: 15))),
        ],
      ),
    );
  }
}
