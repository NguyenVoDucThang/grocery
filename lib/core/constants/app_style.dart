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

  static TextStyle titleAppBar() {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black
    );
  }

  static TextStyle h10() {
    return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black
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

  static TextStyle subTitle() {
    return TextStyle(
      fontSize: 12.sp,
      color: Colors.grey,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle h7() {
    return TextStyle(
      fontSize: 14.sp,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle h6() {
    return TextStyle(
      fontSize: 14.sp,
      color: AppColors.primaryGreen,
    );
  }

  static TextStyle price() {
    return TextStyle(
      fontSize: 16.sp,
      color: AppColors.primaryGreen,
      fontWeight: FontWeight.bold
    );
  }

  static TextStyle h8() {
    return TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
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

  static TextStyle productName() {
    return TextStyle(
      color: AppColors.titleGreen,
      fontSize: 15.sp,
    );
  }
}
