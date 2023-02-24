import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash.png',
                height: 370.h,
                width: 200.w,
              ),
              Text(
                'Grocery Shop',
                style: AppStyle.h1(),
              ),
              Text(
                'at your door',
                style: AppStyle.h2(),
              ),
              SizedBox(height: 10.h),
              Text(
                'The easiest way to buy our grocery shopping',
                style: AppStyle.h3(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              CommonButton(
                text: 'Get Started',
                onPressed: () => Get.toNamed(MyRouter.signInScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
