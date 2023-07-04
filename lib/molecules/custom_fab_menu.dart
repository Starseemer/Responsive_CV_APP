import 'dart:html';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pdfx/pdfx.dart';
import 'package:url_launcher/url_launcher.dart';

class FabMenu extends StatefulWidget {
  @override
  _FabMenuState createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void downloadCV() async {
    print("""Download CV""");
    final pdfController = PdfController(
      document: PdfDocument.openAsset('web/Berk_Yildizgorer_CV.pdf'),
    );

    PdfView view = PdfView(
      controller: pdfController,
    );

    print("""Complete Download CV""");
  }

  final Uri _url = Uri.parse(
      "https://www.linkedin.com/in/berk-y%C4%B1ld%C4%B1zg%C3%B6rer-0397a8144");

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildMenuItem(context, Icons.email, 'berkyldzgorer@gmail.com', null),
        _buildMenuItem(context, Icons.phone, '+49 176 7980 8498', null),
        _buildMenuItem(context, Bootstrap.linkedin, 'LinkedIn', _launchUrl),
        _buildMenuItem(context, Icons.download, 'Download CV', downloadCV),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
          child: FloatingActionButton.extended(
            label: Text('Contact'),
            backgroundColor: Color.fromARGB(119, 6, 30, 49),
            onPressed: _toggleMenu,
            icon: Icon(_isExpanded ? Icons.close : Icons.menu),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String text,
      void Function()? onTap) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: EdgeInsets.only(
            bottom: 10, right: MediaQuery.of(context).size.width * 0.1),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (_isExpanded)
            GestureDetector(
              onTap: onTap,
              child: BlurryContainer(
                color: const Color.fromARGB(119, 6, 30, 49),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    onTap != null ? Text(text) : SelectableText(text),
                  ],
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
