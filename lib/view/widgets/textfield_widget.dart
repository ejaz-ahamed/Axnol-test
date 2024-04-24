import 'package:axnol_project/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String? suffixText;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.text,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black),
        fillColor: const Color(0xffF3F5F5),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xff000000),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Color(0xff000000),
            width: 1,
          ),
        ),
        suffix: Text(suffixText ?? ''),
        suffixStyle: const TextStyle(
          color: Apptheme.primary,
          fontWeight: FontWeight.w800,
        ),
        // suffixIcon: Align(
        //   alignment: Alignment.centerRight,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 16),
        //     child: Text(
        //       suffixText ?? '',
        //       style: const TextStyle(
        //         color: Apptheme.primary,
        //         fontWeight: FontWeight.w700,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
