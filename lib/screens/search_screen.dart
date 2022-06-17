import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/config/grants.dart';
import 'package:teaching_app/repository/repos.dart';
import 'package:teaching_app/repository/univerlist.dart';
import 'package:teaching_app/widgets/bottom_categories.dart';
import 'package:teaching_app/widgets/categories.dart';

import '../widgets/card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Faker faker = Faker();
  final double _price = 0;
  int selectedPrice = 4;

  final double _age = 0;
  List<String> subjects = [
    "Гранты",
    "Университеты",
    "Вакансии",
    "Стипендии",
  ];
  List<String> searchFilter = [
    'По релевантности',
    'По дистанции',
    'По рейтингу',
    'По дате строения',
  ];
  List<String> selectedSubjects = [];
  bool search = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: TextFormField(
                cursorColor: greenMed,
                enableSuggestions: true,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: true,
                    fillColor: const Color(0xffDCEBEA),
                    hintStyle: TextStyle(fontSize: 15, color: greenDark),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: greenDark,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            builder: (_) => BottomCategories(
                                cities: cities, categories: categories));
                      },
                      child: Image.asset(
                        "assets/search.png",
                      ),
                    ),
                    hintText: "Искать по категориям",
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 17, maxWidth: 50),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    prefixStyle: TextStyle(color: greenDark),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          search
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 1,
                  itemBuilder: (context, index) => TeacherCard(
                      image: univerList[index].image,
                      title: univerList[index].title,
                      city: univerList[index].city),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: CategoriesFilter(cities: searchFilter),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: grants.length,
                        itemBuilder: (context, index) => TeacherCard(
                              image: 'assets/splash.png',
                              title: grants[index]['title']!,
                              city: 'Колличество грантов:  ' +
                                  grants[index]['amount']!,
                            ))
                  ],
                )
        ],
      ),
    );
  }
}
