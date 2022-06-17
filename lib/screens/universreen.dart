import 'package:flutter/material.dart';
import 'package:teaching_app/config/jobs.dart';
import 'package:teaching_app/widgets/card_widget.dart';
import 'package:teaching_app/widgets/searchwid.dart';

class UniverScreen extends StatelessWidget {
  const UniverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchWid(),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: jobs.length,
              // itemCount: min(limit, 12),
              itemBuilder: (context, index) => TeacherCard(
                  image: 'assets/icons/user.png',
                  title: jobs[index]['title']!,
                  city: jobs[index]['location']!),
            ),
          ],
        ),
      ),
    );
  }
}
