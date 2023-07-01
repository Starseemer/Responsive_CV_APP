import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/bullet_point_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class InfoCard extends StatefulWidget {
  const InfoCard(
      {super.key,
      required this.instution,
      required this.title,
      required this.location,
      required this.start_date,
      required this.end_date,
      this.bullet_points = const []});

  final String instution;
  final String title;
  final String location;
  final String start_date;
  final String end_date;
  final List<BulletPointText> bullet_points;
  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlurryContainer(
              padding: const EdgeInsets.all(20),
              color: const Color.fromARGB(119, 6, 30, 49),
              borderRadius: BorderRadius.circular(20),
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.instution,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                            ),
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.location,
                                    style:
                                        Theme.of(context).textTheme.titleSmall))
                          ]),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.title,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "${widget.start_date} - ${widget.end_date}",
                                  style:
                                      Theme.of(context).textTheme.bodyLarge)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    ...widget.bullet_points
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
