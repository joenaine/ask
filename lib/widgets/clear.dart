import 'package:flutter/material.dart';

import '../config/colors_.dart';

class ClearWidget extends StatelessWidget {
  const ClearWidget({
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
        child: Text(
          "Очистить",
          style: TextStyle(
              color: greenLight, fontWeight: FontWeight.w500, fontSize: 17),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor:
                MaterialStateProperty.all(greenLight.withOpacity(0.2)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
                side: BorderSide(color: greenLight)))),
      ),
    );
  }
}
