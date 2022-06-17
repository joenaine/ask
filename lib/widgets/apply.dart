import 'package:flutter/material.dart';
import 'package:teaching_app/config/colors_.dart';

class ApplyWidget extends StatelessWidget {
  const ApplyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Применить",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(greenLight),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ))),
      ),
    );
  }
}
