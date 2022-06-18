import 'package:flutter/material.dart';
import 'package:teaching_app/config/grants.dart';
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
                itemCount: grants.length,
                itemBuilder: (context, index) => TeacherCard(
                      price: grants[index]['group']!,
                      title: grants[index]['title']!,
                      city: 'Колличество грантов:  ' + grants[index]['amount']!,
                    ))
          ],
        ),
      ),
    );
  }
}
