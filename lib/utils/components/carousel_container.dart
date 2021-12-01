import 'package:flutter/material.dart';
import 'package:testapp/utils/buttons/grad_button.dart';

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({
    required this.creator,
    required this.width,
  });

  final String creator;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: const BoxDecoration(
        color: Color(0xFFFEEFD6),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: 20, horizontal: width * 0.063),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '#finance',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFFACAFB3)),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  'How to',
                  style: TextStyle(
                    color: Color(0xFFF57553),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'invest in NFTs?',
                  style: TextStyle(
                    color: Color(0xFFF57553),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: GradButton(
                    title: 'watch now',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: width * 0.1527,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  creator,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFACAFB3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
