import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String) onSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[50],
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
        ),
        onSubmitted: (value) => onSubmitted(value),
      ),
    );
  }
}
