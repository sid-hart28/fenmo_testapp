import 'package:flutter/material.dart';

class HeadContainer extends StatelessWidget {
  const HeadContainer({
    this.title = '',
    this.color1 = const Color(0xFF15202B),
    this.color2 = const Color(0xFF626A71),
    this.angle = 0,
  });

  final String title;
  final Color color1;
  final Color color2;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          transform: GradientRotation(angle),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(300, 40),
          bottomRight: Radius.elliptical(300, 40),
        ),
      ),
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.format_align_left,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.messenger,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
