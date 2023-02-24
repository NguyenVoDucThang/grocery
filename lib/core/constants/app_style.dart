import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kid_shop/core/constants/app_colors.dart';

class AppStyle {
  static TextStyle h1() {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle h2() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle h3() {
    return TextStyle(
      fontSize: 14.sp,
      color: Colors.grey,
    );
  }

  static TextStyle h4() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
    );
  }

  static TextStyle h5() {
    return TextStyle(
      color: AppColors.primaryGreen,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
