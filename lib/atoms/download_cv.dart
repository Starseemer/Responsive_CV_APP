import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class CvButton extends StatefulWidget {
  @override
  _CvButtonState createState() => _CvButtonState();
}

class _CvButtonState extends State<CvButton> {
  Future<void> get_Cv() async {
    final newTab = window.open('', '_blank');
    newTab.location.href = '/download-pdf';
  }

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(119, 6, 30, 49),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 30,
        width: 100,
        child: TextButton(
          onPressed: get_Cv,
          child: Row(
            children: [
              const Icon(
                Icons.download,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'CV',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
