import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    required this.onPressed,
    this.followed = false,
  });

  final bool followed;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 85, height: 28),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: followed ? Colors.transparent : const Color(0xFF15202B),
          side: const BorderSide(color: Colors.white, width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: onPressed,
        child: followed
            ? const Text('following',
                style: TextStyle(
                  fontSize: 12,
                ))
            : const Text('follow',
                style: TextStyle(
                  fontSize: 12,
                )),
      ),
    );
  }
}
