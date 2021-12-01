import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    required this.color1,
    required this.color2,
    required this.title,
  });
  final Color color1, color2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        color: color2,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle( fontSize: 14),
          ),
        ],
      ),
    );
  }
}
