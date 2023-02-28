import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kid_shop/core/constants/app_colors.dart';

class CustomOutlineTextFormField extends StatelessWidget {
  final String hintText;
  final String label;
  final Function(String? value) validator;
  final bool obscureText;
  final TextEditingController controller;

  const CustomOutlineTextFormField({
    Key? key,
    required this.obscureText,
    required this.label,
    required this.hintText,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: (value) => validator(value),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: 15.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryGreen),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryGreen),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryGreen),
            ),
          ),
        ),
      ],
    );
  }
}
