import 'package:flutter/material.dart';

class IconHolder extends StatelessWidget {
  IconHolder(
      {required this.icon, required this.onPressed, this.title = 'data'});

  final Icon icon;
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black26,
            radius: 25,
            child: IconButton(
              splashRadius: 25,
              onPressed: onPressed,
              icon: icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
