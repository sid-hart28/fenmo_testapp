import 'package:flutter/material.dart';

class GradButton extends StatelessWidget {
  const GradButton({
    required this.title,
    required this.onPressed,
    this.color1 = const Color(0xFFF57553),
    this.color2 = const Color(0xCAFC9B80),
  });

  final void Function() onPressed;
  final Color color1;
  final Color color2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1),
      width: 150,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style:const TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 14),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
