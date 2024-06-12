import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showSnackBar(BuildContext context, String message, Color backgroundColor) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
      ),
    );
  });
}
