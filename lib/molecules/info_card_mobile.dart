import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../atoms/bullet_point_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import '../atoms/size_measurer.dart';

class InfoCardMobile extends StatefulWidget {
  const InfoCardMobile(
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
  _InfoCardMobileState createState() => _InfoCardMobileState();
}

class _InfoCardMobileState extends State<InfoCardMobile> {
  double _institutionSize = 0.0;
  double _titleSize = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      double _institutionSize = 0.0;
      double _titleSize = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          BlurryContainer(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              color: const Color.fromARGB(119, 6, 30, 49),
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.all(0),
              child: Card(
                color: Colors.transparent,
                margin: EdgeInsets.zero,
                elevation: 0,
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            width:
                                MediaQuery.of(context).size.width * 0.8 * 0.7,
                            height:
                                MediaQuery.of(context).size.height * 0.6 * 0.1,
                            padding: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(176, 74, 113, 180),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      "${widget.start_date} - ${widget.end_date}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  Text(widget.location,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6 * 0.05,
                      ),
                      MeasureSize(
                        onChange: (size) {
                          setState(() {
                            _institutionSize = size.height;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(119, 6, 30, 49),
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.white, width: 1.0),
                                  bottom: BorderSide(
                                      color: Colors.white, width: 1.0))),
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.instution,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      widget.title != ""
                          ? MeasureSize(
                              onChange: (size) {
                                setState(() {
                                  _titleSize = size.height;
                                });
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(119, 6, 30, 49),
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.white, width: 1.0),
                                        bottom: BorderSide(
                                            color: Colors.white, width: 1.0))),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                            )
                          : SizedBox(height: 0),
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: ((MediaQuery.of(context).size.height * 0.65) -
                                _institutionSize -
                                _titleSize) *
                            0.6,
                        child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 10),
                          shrinkWrap: true,
                          itemCount: widget.bullet_points.length,
                          itemBuilder: (context, index) {
                            return widget.bullet_points[index];
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
