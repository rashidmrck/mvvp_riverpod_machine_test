import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormStepsModel {
  String title;
  String label;
  bool status;
  final Widget Function(WidgetRef ref) formWidgetBuilder; 

  FormStepsModel({
    required this.title,
    required this.formWidgetBuilder,
    required this.label,
    required this.status,
  });
}