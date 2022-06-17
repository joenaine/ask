import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Divider(
        color: Color(0xffE1E7E7),
        indent: 10,
        endIndent: 10,
        height: 1,
      ),
    );
  }
}
