import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:provider/src/provider.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Center(
              child: Image.asset(
                'assets/images/order_confirmed.png',
                height: Get.width * 0.4,
                width: Get.width * 0.4,
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              'Order Confirmed',
              style: AppStyle.h1(),
            ),
            SizedBox(height: 20.h),
            const Text('Your order has been confirmed'),
            const Text('Will be delivered soon'),
            SizedBox(height: 50.h),
            const Text('Order id: 100000090'),
            SizedBox(height: 50.h),
            CommonButton(
              onPressed: () {
                context.read<ICartPageViewModel>().confirmOrder();
                Get.offAndToNamed(MyRouter.homeScreen);
              },
              text: 'Go home',
            )
          ],
        ),
      ),
    );
  }
}
