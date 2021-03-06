import 'package:flutter/material.dart';

import '../config/colors_.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.title,
    required this.city,
    required this.price,
  }) : super(key: key);

  final String title;
  final String city;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greenDark.withOpacity(0.12), width: 1),
          color: Colors.white),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    city,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "??? 4.5  ",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff91919F),
                        fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
