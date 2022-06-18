import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/repository/data.dart';
import 'package:teaching_app/repository/repos.dart';
import 'package:teaching_app/widgets/bottom_categories.dart';
import 'package:teaching_app/widgets/categories.dart';
import 'package:teaching_app/widgets/job_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Faker faker = Faker();
  final double _price = 0;
  int selectedPrice = 4;
  TextEditingController controller = TextEditingController();

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

  final List<Jobs> _search = [];

  List<String> selectedSubjects = [];
  bool search = false;

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var f in joblistFinal) {
      if (f.title.toLowerCase().contains(text) ||
          f.time.toLowerCase().contains(text) ||
          f.company.toLowerCase().contains(text.toLowerCase()) ||
          f.location.toLowerCase().contains(text.toLowerCase()) ||
          f.price.toLowerCase().contains(text.toLowerCase())) _search.add(f);
    }

    setState(() {});
  }

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
                onChanged: onSearch,
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  children: [
                    CategoriesFilter(cities: searchFilter),
                    Container(
                        child: _search.isNotEmpty || controller.text.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: _search.length,
                                itemBuilder: (context, i) {
                                  final b = _search[i];
                                  return JobCardWidget(
                                      title: b.title,
                                      city: b.location,
                                      price: b.price,
                                      company: b.company,
                                      time: b.time);
                                },
                              )
                            : Container())
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
