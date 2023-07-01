import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Pager extends StatefulWidget {
  const Pager(
      {super.key,
      required this.pages,
      required this.pageController,
      required this.onPageChanged});

  final List<Widget> pages;
  final PageController pageController;
  final Function(int) onPageChanged;
  @override
  State<Pager> createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  int _index = 0;

  final _animationDuration = Duration(milliseconds: 500);
  final _curve = Curves.easeIn;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          if (pointerSignal.scrollDelta.dy > 0) {
            widget.pageController
                .nextPage(curve: _curve, duration: _animationDuration);
          } else {
            widget.pageController
                .previousPage(duration: _animationDuration, curve: _curve);
          }
        }
      },
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.pageController,
        onPageChanged: widget.onPageChanged,
        scrollDirection: Axis.vertical,
        children: [
          ...widget.pages,
        ],
      ),
    );
  }
}
