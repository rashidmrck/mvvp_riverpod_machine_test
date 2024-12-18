import 'package:flutter/material.dart';
import 'package:mvvp_riverpod_machine_test/const.dart';

class CustomeListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String count;
  final bool selected;

  const CustomeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: selected ? colorOrange : Colors.grey,
        child: CircleAvatar(
          backgroundColor: selected ? colorOrange : Colors.white,
          radius: 18,
          child: Center(
            child: Text(
              count,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      title: Text(
        title,
      ),
      subtitle: Text(subtitle),
    );
  }
}