import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedArrow extends StatelessWidget {
  const AnimatedArrow({Key? key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return MirrorAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 150.0), // value for offset x-coordinate
        duration: const Duration(seconds: 2),
        curve: Curves.bounceIn, // non-linear animation
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value, 0), // use animated value for x-coordinate
            child: child,
          );
        },
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
          ],
        ));
  }
}
