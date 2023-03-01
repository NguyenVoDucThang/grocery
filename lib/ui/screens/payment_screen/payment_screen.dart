import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:provider/src/provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalCost = context.read<ICartPageViewModel>().getTotalCost();

    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: Text(
          'Payment',
          style: AppStyle.titleAppBar(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount To Pay',
                          style: AppStyle.h10(),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '\$$totalCost',
                          style: AppStyle.price(),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Detail',
                        style: AppStyle.h6(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Card(
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.h),
                child: Row(
                  children: [
                    const Icon(Icons.credit_card),
                    SizedBox(width: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Master Card',
                          style: AppStyle.h10(),
                        ),
                        SizedBox(height: 5.h),
                        const Text('0000 0000 0000 0000'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Price',
                        style: AppStyle.h3(),
                      ),
                      const Spacer(),
                      Text(
                        '\$$totalCost',
                        style: AppStyle.price(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'Delivery charge',
                        style: AppStyle.h3(),
                      ),
                      const Spacer(),
                      Text(
                        '\$50.0',
                        style: AppStyle.price(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'Total Price',
                        style: AppStyle.h3(),
                      ),
                      const Spacer(),
                      Text(
                        '\$${totalCost + 50}',
                        style: AppStyle.price(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 70.h),
            CommonButton(
              onPressed: () => Get.toNamed(MyRouter.orderConfirmedScreen),
              text: 'Pay Now',
            )
          ],
        ),
      ),
    );
  }
}
