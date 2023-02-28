import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';

class ProfilePage extends StatelessWidget {
  final AccountDto? accountDto;

  const ProfilePage({Key? key, required this.accountDto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                    radius: 38,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    accountDto == null ? 'UserName' : accountDto!.username,
                    style: AppStyle.h7(),
                  ),
                  Text(
                    accountDto == null ? 'UserName' : accountDto!.email,
                    style: AppStyle.h3(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              'Settings',
              style: AppStyle.h10(),
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: () {},
              child: Row(
                children:  [
                  const Icon(Icons.person_outline),
                  SizedBox(width: 5.w),
                  const Text ('User Information'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(MyRouter.cartScreen),
              child: Row(
                children:  [
                  const Icon(Icons.shopping_cart_outlined),
                  SizedBox(width: 5.w),
                  const Text ('My Cart'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(MyRouter.favoriteScreen),
              child: Row(
                children:  [
                  const Icon(Icons.favorite_border_outlined),
                  SizedBox(width: 5.w),
                  const Text ('My Favorites'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children:  [
                  const Icon(Icons.notifications_none_outlined),
                  SizedBox(width: 5.w),
                  const Text ('Notification'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children:  [
                  const Icon(Icons.help_outline_outlined),
                  SizedBox(width: 5.w),
                  const Text ('Help'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(MyRouter.signInScreen),
              child: Row(
                children:  [
                  const Icon(Icons.login_outlined),
                  SizedBox(width: 5.w),
                  const Text ('Logout'),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
