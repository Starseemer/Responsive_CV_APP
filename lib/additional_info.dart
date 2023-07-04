import 'package:cv_web_site/atoms/bullet_point_text.dart';
import 'package:cv_web_site/molecules/mobile_page_dock.dart';
import 'package:flutter/material.dart';
import 'molecules/info_card.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'molecules/additional_info_card_headlined.dart';
import 'molecules/mobile_additional_info_card_headlined.dart';

class AdditionalPage extends StatefulWidget {
  const AdditionalPage({super.key});

  @override
  _AdditionalPageState createState() => _AdditionalPageState();
}

class _AdditionalPageState extends State<AdditionalPage> {
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
      BulletPointText(text: "Languages: English (Advanced - IELTS 7.0)"),
      BulletPointText(
          text:
              "Programming languages & software: Python (Advanced), Java (Advanced), PHP (Advanced), Android Programming (Advanced), C++ (Intermediate), R (Intermediate), JavaScript (Intermediate), Kotlin (Intermediate), Office 360, msSQL, Toad for Oracle, Core, Knime, Linux Debian/Arch, Firebase, DTS, HTML & CSS, Apache, Docker, PostgreSQL\n"),
      BulletPointText(
          text:
              "Interests: Theater- Actor (BOHEM Youth), Movies and TV series, Basketball, Cycling"),
    ];
    List<BulletPointText> cer_point = [
      BulletPointText(text: "Developing on AWS - Amazon Web Services (AWS)"),
      BulletPointText(text: "Advanced Java SE Programming - DEEPCLOUDLABS"),
    ];
    List<BulletPointText> ref_point = [
      BulletPointText(
          text:
              "Asst. Prof. Dr. Taner ARSAN\nKadir Has University, Computer Engineering\nPhone: +90 212 533 6532 | Email: arsan@khas.edu.tr"),
      BulletPointText(
          text:
              "Bogac Turgut\nSiemens, Products & Solutions Development Team Leader\nPhone: +90 535 570 0632| Email: bogac.turgut@siemes.com"),
    ];

    List<AdditionalInfoHeadlined> items = [
      AdditionalInfoHeadlined(
          headline: "Additional Information", bullet_points: points),
      AdditionalInfoHeadlined(
          headline: "Certifications", bullet_points: cer_point),
      AdditionalInfoHeadlined(headline: "References", bullet_points: ref_point),
    ];

    List<MobileAdditionalInfoHeadlined> mob_items = [
      MobileAdditionalInfoHeadlined(
          headline: "Additional Info.", bullet_points: points),
      MobileAdditionalInfoHeadlined(
          headline: "Certifications", bullet_points: cer_point),
      MobileAdditionalInfoHeadlined(
          headline: "References", bullet_points: ref_point),
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

    // IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //Column size is too high for mobile devices, need to fix it.
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTapDown: (TapDownDetails details) =>
                MediaQuery.of(context).size.width < 880
                    ? Null
                    : onTapDown(context, details),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.width < 880
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: PageView.builder(
                  controller: _pageController,

                  itemCount:
                      items.length, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    double currentPageOffset = index - _currentPage;
                    double scale = max(1 - currentPageOffset.abs() * 0.3, 0.5);
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
          const SizedBox(
            height: 10,
          ),
          PageDockMobile(
              index: _currentPage.toInt(),
              page_count: items.length,
              onTap: innerOnTap)
        ],
      ),
    );
  }
}
