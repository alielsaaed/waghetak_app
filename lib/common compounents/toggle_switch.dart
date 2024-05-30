import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: Colors.green,
      value: switchValue,
      onChanged: (value) {
        setState(() {
          switchValue = value;
        });
      },
    );
  }
}
