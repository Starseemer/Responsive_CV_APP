import 'package:cv_web_site/atoms/bullet_point_text.dart';
import 'package:flutter/material.dart';
import 'molecules/info_card.dart';
import 'molecules/info_card_mobile.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'molecules/mobile_page_dock.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
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

    List<BulletPointText> points = [
      const BulletPointText(
          text:
              "%50 Tuition Scholarship (based on the National University Entrance Exam ranking)"),
      const BulletPointText(text: "GPA: 3.01/4.0 (4.0 is best)"),
      const BulletPointText(text: "Graduated with honor degree"),
    ];
    List<BulletPointText> points_frei = [
      const BulletPointText(text: "Specialization: Artificial Intelligence"),
    ];
    List<InfoCard> items = [
      InfoCard(
          instution: "University of Freiburg",
          location: "Freiburg, Germany",
          title: "M.Sc. Computer Science",
          start_date: "Oct 2022",
          end_date: "Present",
          bullet_points: points_frei),
      InfoCard(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "M.Sc. Computer Engineering",
        start_date: "Sept. 2015",
        end_date: "Jult 2020",
        bullet_points: points,
      ),
    ];
    List<InfoCardMobile> mobile_items = [
      InfoCardMobile(
          instution: "University of Freiburg",
          location: "Freiburg, Germany",
          title: "M.Sc. Computer Science",
          start_date: "Oct 2022",
          end_date: "Present",
          bullet_points: points_frei),
      InfoCardMobile(
        instution: "Kadir Has University",
        location: "Istanbul, Turkey",
        title: "M.Sc. Computer Engineering",
        start_date: "Sept. 2015",
        end_date: "Jult 2020",
        bullet_points: points,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BlurryContainer(
                  color: Color.fromARGB(119, 6, 30, 49),
                  padding: EdgeInsets.all(8),
                  blur: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Text(
                    'Education',
                    style: MediaQuery.of(context).size.width < 880
                        ? Theme.of(context).textTheme.titleMedium
                        : Theme.of(context).textTheme.titleLarge,
                  ).animate().shimmer(
                      duration: const Duration(seconds: 3),
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
            child: Center(
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
                              ? mobile_items[index]
                              : items[index],
                        );
                      },
                    ),
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
            page_count: mobile_items.length,
            onTap: innerOnTap,
          )
        ],
      ),
    );
  }
}
