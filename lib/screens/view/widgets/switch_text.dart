
import 'package:flutter/material.dart';

class SwitchWithText extends StatelessWidget {
  final String label;
  final bool value;
  final void Function(bool) onChanged;

  const SwitchWithText({
    required this.onChanged,
    required this.label,
    this.value = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: value,
          activeTrackColor: Colors.deepOrange,
          activeColor: Colors.white,
          onChanged: onChanged,
        ),
      ],
    );
  }
}