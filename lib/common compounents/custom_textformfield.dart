import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/constants.dart';

class TextFormFieldCustom extends StatelessWidget {
  final BuildContext context;
  final String labelText;
  // final void Function(String) onChanged;
  final TextEditingController controller;
  // final String? validatorErrorMessage;
  bool? border = true;
  bool? number = false;
  bool? password = false;
  String? value;
  double length;

  TextFormFieldCustom({
    super.key,
    required this.context,
    required this.labelText,
    // required this.onChanged,
    required this.controller,
    // this.validatorErrorMessage,
    this.border,
    this.value,
    this.number,
    this.password,
    this.length = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: value == null ? controller : null,
        initialValue: value,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This Field Is Required";
          }
          return null;
        },
        // onChanged: (value) => onChanged(value),
        keyboardType:
            number == true ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: length == 0 ? null : EdgeInsets.only(bottom: length),
          labelText: labelText,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          fillColor: grey.withOpacity(0.5),
          filled: true,
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: darkGrey,
                overflow: TextOverflow.clip,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
        ));
  }
}
