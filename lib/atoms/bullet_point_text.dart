import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BulletPointText extends StatelessWidget {
  const BulletPointText(
      {super.key,
      required this.text,
      this.style = const TextStyle(color: Colors.white, fontSize: 20),
      this.padding = 10});

  final String text;
  final double padding;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("\u2022",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            width: this.padding,
          ),
          Flexible(
            child: Text(this.text,
                softWrap: true,
                style: style,
                maxLines: 4,
                overflow: TextOverflow.ellipsis),
          ),
          SizedBox(
            width: this.padding,
          ),
        ],
      ),
    );
  }
}
