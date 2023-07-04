import 'package:cv_web_site/atoms/bullet_point_text.dart';
import 'package:cv_web_site/molecules/mobile_page_dock.dart';
import 'package:flutter/material.dart';
import 'molecules/info_card.dart';
import 'molecules/info_card_mobile.dart';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  PageController _pageController = PageController();
  double _currentPage = 0;
  double _viewportFraction = 0.8;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: _currentPage.toInt(),
        keepPage: false,
        viewportFraction: _viewportFraction);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toDouble();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double calculateViewportFraction(double width) {
    // Define your desired logic to calculate the viewportFraction
    if (width < 880) {
      return 0.8;
    } else {
      return 0.6;
    }
  }

  @override
  Widget build(BuildContext context) {
    _viewportFraction =
        calculateViewportFraction(MediaQuery.of(context).size.width);
    _pageController = PageController(
        initialPage: _currentPage.toInt(),
        keepPage: false,
        viewportFraction: _viewportFraction);

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toDouble();
      });
    });

    const List<BulletPointText> siemens_points = [
      BulletPointText(
          text:
              "Design and develop a global fire tracking and satellite imagery API and frontend by utilizing and combining many technologies like Liveua Map API, NASA FIRMS API, SkyWatch API, OpenLayer map service, Geoserver, Docker, NodeJS and ReactJS"),
      BulletPointText(
          text:
              "While building this application we have used micro service architecture to make it easier to scale both for user demand and future development opportunities"),
      BulletPointText(
          text:
              "Design and develop a Gstreamer python library to make pipelines run in parallels and/or sequentially"),
      BulletPointText(
          text:
              "Created a face and body recognition pipeline elements with Gstreamer by integrating OpenCV and open-source Python-Gstreamer wrapper software which made recognitions faster than using only OpenCV"),
    ];

    const List<BulletPointText> huawei_points = [
      BulletPointText(
          text:
              "Built documentation & application test automation API using Python, Docker, and PostgreSQL"),
      BulletPointText(
          text:
              "Created a web application to utilize test automation API using JavaScript, HTML, and CSS"),
      BulletPointText(
          text: "Created Android Applications to test Huawei Mobile Services"),
    ];

    const List<BulletPointText> acron_points = [
      BulletPointText(
          text: "Built web application for ACRON clients using SAP tools"),
      BulletPointText(
          text:
              "Utilized R programming language on SAP cloud system to predict profitability of new product lines based on models using proprietary data"),
    ];

    const List<BulletPointText> ibtech_points = [
      BulletPointText(
          text:
              "Business Analyst and Tester Intern at IBTech, a QNB Finance subsidiary"),
      BulletPointText(
          text:
              "Gained proficiency in msSQL, Toad for Oracle, and “Core” – QNB Finance internal system application"),
      BulletPointText(
          text:
              "Tested mobile applications and submitted analysis results and reports"),
      BulletPointText(
          text:
              "Created self-monitoring and self-organizing Java GUI applications for QNB Finance domain\n"),
    ];

    const List<BulletPointText> stud_points = [
      BulletPointText(
          text:
              "Worked with faculty professor in a machine learning project; created a machine learning model that can improve the accuracy of data location measurements"),
      BulletPointText(
          text:
              "Led a team of 5 students to develop Android and IOS applications for Kadir Has University providing students with a course selection application tool"),
    ];

    const List<BulletPointText> ieee_points = [
      BulletPointText(
          text:
              "Lectured 25 students on a weekly basis to develop their programming skills"),
      BulletPointText(
          text:
              "Organized Python programming language classes for the IEEE student club"),
    ];

    const List<BulletPointText> zeo_points = [
      BulletPointText(
          text:
              "Conducted detailed comparative analysis of search engine rankings on Screaming Frog SEO Spider Software; reviewed Turkish Fortune 500 companies to identify potential clients as directed by marketing manager"),
      BulletPointText(
          text:
              "Prepared marketing analyses to be used in sales presentations; participated in sales meetings"),
    ];

    const List<InfoCard> items = [
      InfoCard(
        instution: "Siemens",
        location: "Istanbul, Turkey",
        title: "Software Developer",
        start_date: "Sept. 2021",
        end_date: "Oct. 2022",
        bullet_points: siemens_points,
      ),
      InfoCard(
        instution: "Huawei",
        location: "Istanbul, Turkey",
        title: "Android Developer Engineer",
        start_date: "Aug. 2020",
        end_date: "July 2021",
        bullet_points: huawei_points,
      ),
      InfoCard(
        instution: "ACRON CONSULTING",
        location: "Istanbul, Turkey",
        title: "Business Intelligence Intern",
        start_date: "July 2019",
        end_date: "Aug. 2019",
        bullet_points: acron_points,
      ),
      InfoCard(
        instution: "IBTech International Info. and Communication Technologies",
        location: "Istanbul, Turkey",
        title: "Business Analyst and Tester Intern",
        start_date: "June 2018",
        end_date: "Aug 2018",
        bullet_points: ibtech_points,
      ),
      InfoCard(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "Student Assistant",
        start_date: "Sept 2018",
        end_date: "Oct 2019",
        bullet_points: stud_points,
      ),
      InfoCard(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "Instructor at IEEE Computer Society",
        start_date: "Dec 2017",
        end_date: "Jan 2018",
        bullet_points: ieee_points,
      ),
      InfoCard(
        instution: "ZEO AGENCY, SEO Consultant & Digital Marketing Agency",
        location: "Istanbul, Turkey",
        title: "Instructor at IEEE Computer Society",
        start_date: "Jul 2016",
        end_date: "Sept 2016",
        bullet_points: zeo_points,
      ),
    ];

    const List<InfoCardMobile> mob_items = [
      InfoCardMobile(
        instution: "Siemens",
        location: "Istanbul, Turkey",
        title: "Software Developer",
        start_date: "Sept. 2021",
        end_date: "Oct. 2022",
        bullet_points: siemens_points,
      ),
      InfoCardMobile(
        instution: "Huawei",
        location: "Istanbul, Turkey",
        title: "Android Developer Engineer",
        start_date: "Aug. 2020",
        end_date: "July 2021",
        bullet_points: huawei_points,
      ),
      InfoCardMobile(
        instution: "ACRON CONSULTING",
        location: "Istanbul, Turkey",
        title: "Business Intelligence Intern",
        start_date: "July 2019",
        end_date: "Aug. 2019",
        bullet_points: acron_points,
      ),
      InfoCardMobile(
        instution: "IBTech International Info. and Communication Technologies",
        location: "Istanbul, Turkey",
        title: "Business Analyst and Tester Intern",
        start_date: "June 2018",
        end_date: "Aug 2018",
        bullet_points: ibtech_points,
      ),
      InfoCardMobile(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "Student Assistant",
        start_date: "Sept 2018",
        end_date: "Oct 2019",
        bullet_points: stud_points,
      ),
      InfoCardMobile(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "Instructor at IEEE Computer Society",
        start_date: "Dec 2017",
        end_date: "Jan 2018",
        bullet_points: ieee_points,
      ),
      InfoCardMobile(
        instution: "ZEO AGENCY, SEO Consultant & Digital Marketing Agency",
        location: "Istanbul, Turkey",
        title: "Instructor at IEEE Computer Society",
        start_date: "Jul 2016",
        end_date: "Sept 2016",
        bullet_points: zeo_points,
      ),
    ];

    void onTapDown(BuildContext context, TapDownDetails details) {
      final RenderObject? box = context.findRenderObject();
      if (box is RenderBox) {
        final Offset localOffset = box.globalToLocal(details.globalPosition);
        if (localOffset.dx > MediaQuery.of(context).size.width / 2) {
          _pageController.nextPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          _pageController.previousPage(
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      }
    }

    void innerOnTap(int index) {
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }

    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BlurryContainer(
                  color: Color.fromARGB(119, 6, 30, 49),
                  padding: EdgeInsets.all(8),
                  blur: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Text(
                    'Work Experience',
                    style: MediaQuery.of(context).size.width < 880
                        ? Theme.of(context).textTheme.titleMedium
                        : Theme.of(context).textTheme.titleLarge,
                  ).animate().shimmer(
                      duration: const Duration(seconds: 3),
                      color: Colors.white,
                      colors: [
                        Colors.white,
                        Color.fromARGB(119, 50, 107, 153),
                        Color.fromARGB(255, 102, 64, 254),
                        Color.fromARGB(255, 81, 58, 176),
                        Color.fromARGB(255, 81, 58, 176),
                        Color.fromARGB(255, 81, 58, 176),
                        Color.fromARGB(255, 35, 45, 140),
                        Color.fromARGB(255, 58, 68, 157),
                        Color.fromARGB(255, 58, 68, 157),
                        Color.fromARGB(255, 125, 130, 180),
                        Color.fromARGB(255, 212, 213, 220),
                      ],
                      curve: Curves.easeIn))
              .animate()
              .moveY(
                  begin: 30,
                  end: -10,
                  delay: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500)),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details) =>
                MediaQuery.of(context).size.width < 880
                    ? Null
                    : onTapDown(context, details),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.width < 880
                      ? MediaQuery.of(context).size.height * 0.62
                      : MediaQuery.of(context).size.height * 0.5,
                  child: PageView.builder(
                    controller: _pageController,

                    itemCount:
                        items.length, // Replace with your actual item count
                    itemBuilder: (context, index) {
                      double currentPageOffset = index - _currentPage;
                      double scale =
                          max(1 - currentPageOffset.abs() * 0.3, 0.5);
                      double angle = currentPageOffset * 0.4;

                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // Add perspective
                          ..rotateY(angle) // Rotate along Y-axis
                          ..scale(scale), // Scale based on position
                        alignment: Alignment.center,
                        child: MediaQuery.of(context).size.width < 880
                            ? mob_items[index]
                            : items[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          PageDockMobile(
            index: _currentPage.toInt(),
            page_count: items.length,
            onTap: innerOnTap,
          )
        ],
      ),
    );
  }
}
