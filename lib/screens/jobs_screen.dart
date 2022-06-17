import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      color: const Color(0xff008080),
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: const Text(
                    'asdasdasdasdasdasd',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.bookmark),
                      color: Colors.grey,
                      iconSize: 15,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'asdasdasdasdas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'asdasdasdasdasd',
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 4,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.timer_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: const Text(
                      'Be in the first 20 applicants',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
