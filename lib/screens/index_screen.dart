import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teaching_app/config/colors_.dart';
import 'package:teaching_app/config/jobs.dart';
import 'package:teaching_app/game4/game4.dart';
import 'package:teaching_app/models/jobs.dart';
import 'package:teaching_app/provider.dart/filter.dart';
import 'package:teaching_app/repository/repos.dart';
import 'package:teaching_app/widgets/bottom_categories.dart';
import 'package:teaching_app/widgets/headerScroll.dart';
import 'package:teaching_app/widgets/job_card.dart';
import 'package:teaching_app/widgets/scrollhead.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late Future<List<JobsMobel>> jobList;
  TextEditingController controller = TextEditingController();
  Faker faker = Faker();

  int limit = 2; // recomended tutor min
  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    int indexOfCity = filterProvider.selectedIndexOfCity;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  backgroundImage: AssetImage('assets/icons/user.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          "Добро пожаловать!",
                          style: TextStyle(fontSize: 12, color: greenDark),
                        ),
                      ),
                    ),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          faker.person.name(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: greenDark),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Badge(
                  badgeColor: redColor,
                  ignorePointer: true,
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    color: greenMed,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),

          SizedBox(
            width: size.width * 0.9,
            child: TextFormField(
              onFieldSubmitted: (value) {
                filterProvider.setNewFilter(value);
              },
              controller: controller,
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
                  hintText: "Поиск",
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                HeaderScroll(filterProvider: filterProvider),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Game4(),
                    ));
                  },
                  child: const ScrollHead(
                    title: 'Тест \nГолланда',
                    icons: 'assets/test.png',
                  ),
                ),
                const ScrollHead(
                  title: 'Полезные статьи и советы',
                  icons: 'assets/job.png',
                ),
              ]),
            ),
          ),

          // SizedBox(
          //   height: 200,
          //   child: PageView.builder(
          //     controller: _pageController,
          //     padEnds: true,
          //     itemCount: 3,
          //     physics: const BouncingScrollPhysics(),
          //     itemBuilder: (_, __) {
          //       return Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 8),
          //         child: Image.asset('assets/cardcar.jpeg'),
          //       );
          //     },
          //   ),
          // ),
          // SmoothPageIndicator(
          //   controller: _pageController,
          //   count: 3,
          //   effect: ExpandingDotsEffect(
          //       dotHeight: 6,
          //       dotWidth: 6,
          //       dotColor: greenTint1,
          //       activeDotColor: greenMed),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: FittedBox(
                  child: Text(
                    "Рекомендованные",
                    style: TextStyle(
                        color: greenDark,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                Flexible(
                    child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      if (limit == 2) {
                        setState(() {
                          limit = 50;
                        });
                      } else {
                        setState(() {
                          limit = 2;
                        });
                      }
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      limit == 2 ? "Больше" : "Меньше",
                      style: GoogleFonts.manrope(
                        color: greenLight,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: jobs.length,
            // itemCount: min(limit, 12),
            itemBuilder: (context, index) => JobCardWidget(
                company: jobs[index]['company']!,
                time: jobs[index]['time']!,
                price: jobs[index]['price']!,
                title: jobs[index]['title']!,
                city: jobs[index]['location']!),
          ),
        ],
      ),
    );
  }

  Future<List<JobsMobel>> carsJson() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      String readString = await DefaultAssetBundle.of(context)
          .loadString('assets/json_job.json');

      var jsonObject = jsonDecode(readString);

      List<JobsMobel> allJobs = (jsonObject as List)
          .map((carMap) => JobsMobel.fromJson(carMap))
          .toList();

      return allJobs;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
