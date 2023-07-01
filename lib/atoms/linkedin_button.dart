import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class LinkedInButton extends StatefulWidget {
  @override
  _LinkedInButtonState createState() => _LinkedInButtonState();
}

class _LinkedInButtonState extends State<LinkedInButton> {
  final Uri _url = Uri.parse(
      "https://www.linkedin.com/in/berk-y%C4%B1ld%C4%B1zg%C3%B6rer-0397a8144");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
        padding: const EdgeInsets.all(20),
        child: TextButton(
          onPressed: _launchUrl,
          child: Row(
            children: [
              SvgPicture.asset(
                'linkedin.svg', // Replace with your LinkedIn icon asset path
                width: 30,
                height: 30,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(width: 20),
              Text(
                'LinkedIn',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
