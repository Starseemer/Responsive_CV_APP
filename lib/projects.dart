import 'package:cv_web_site/atoms/bullet_point_text.dart';
import 'package:flutter/material.dart';
import 'molecules/info_card.dart';
import 'molecules/info_card_mobile.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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

    List<BulletPointText> points = [
      BulletPointText(
          text:
              "Developed online indoor RTLS software by using Ultra-wideband (UWB) sensors"),
      BulletPointText(
          text:
              "Designed scripting language that forms sensor paths; created a website for easy access to the RTLS software"),
      BulletPointText(
          text:
              "Used programming languages: Java, JavaScript, Python, PHP, HTML & CSS"),
      BulletPointText(text: "Used Softwares: Apache, Ubuntu Server 19.04\n"),
    ];

    List<InfoCard> items = [
      InfoCard(
          instution:
              "Indoor Location System and Real Time Location System (RTLS)",
          location: "",
          title: "",
          start_date: "June 2019",
          end_date: "June 2020",
          bullet_points: points),
    ];

    List<InfoCardMobile> mob_items = [
      InfoCardMobile(
          instution:
              "Indoor Location System and Real Time Location System (RTLS)",
          location: "",
          title: "",
          start_date: "June 2019",
          end_date: "June 2020",
          bullet_points: points),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlurryContainer(
                color: Color.fromARGB(119, 6, 30, 49),
                padding: EdgeInsets.all(8),
                blur: 10,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Text(
                  'Projects',
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
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.width < 880
                      ? MediaQuery.of(context).size.height * 0.8
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
        ),
      ],
    );
  }
}
