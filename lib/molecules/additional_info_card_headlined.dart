import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/bullet_point_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AdditionalInfoHeadlined extends StatefulWidget {
  const AdditionalInfoHeadlined(
      {super.key, required this.headline, required this.bullet_points});

  final String headline;
  final List<BulletPointText> bullet_points;
  @override
  _AdditionalInfoHeadlinedState createState() =>
      _AdditionalInfoHeadlinedState();
}

class _AdditionalInfoHeadlinedState extends State<AdditionalInfoHeadlined> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlurryContainer(
                  color: Color.fromARGB(119, 6, 30, 49),
                  blur: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Text(
                    '${widget.headline}',
                    style: Theme.of(context).textTheme.titleLarge,
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
                      curve: Curves.easeInOut))
              .animate()
              .moveY(
                  begin: 40,
                  end: 0,
                  delay: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500)),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(height: 15),
          BlurryContainer(
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(119, 6, 30, 49),
              borderRadius: BorderRadius.circular(20),
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  children: [...widget.bullet_points],
                ),
              )),
        ],
      ),
    );
  }
}
