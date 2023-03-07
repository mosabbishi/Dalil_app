import 'package:flutter/material.dart';

import '../constant/styles.dart';

class FormFields extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hint;
  const FormFields({
    super.key,
    required this.controller,
    this.validator,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.blueGrey[100],
          focusColor: Styles.black,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade100,
            ),
          ),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.red),
          ),
        ),
      ),
    );
  }
}
