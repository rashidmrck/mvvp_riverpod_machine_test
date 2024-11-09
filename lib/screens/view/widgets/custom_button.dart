import 'package:flutter/material.dart';
import 'package:mvvp_riverpod_machine_test/const.dart';

class CustomButton extends StatelessWidget {
  final bool filled;
  final String text;
  final Color? borderSideColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  const CustomButton({
    this.onPressed,
    this.borderSideColor,
    this.textColor,
    this.filled = false,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: filled ? colorOrange : null,
        side: BorderSide(
          color: borderSideColor ?? colorOrange,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: filled ? Colors.white : textColor ?? colorOrange,
        ),
      ),
    );
  }
}
