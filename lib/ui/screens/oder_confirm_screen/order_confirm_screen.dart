import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/constants/text_form_field_validator.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:provider/src/provider.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: Text(
          'Order confirmation',
          style: AppStyle.titleAppBar(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Your Details',
              style: AppStyle.h10(),
            ),
            SizedBox(height: 20.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validator.validateAddress(value),
                    decoration: const InputDecoration(
                      hintText: 'Insert email',
                      prefixIcon: Icon(Icons.location_on_outlined),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validator.validateNumber(value),
                    decoration: const InputDecoration(
                      hintText: 'Insert number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => Validator.validateAddress(value),
                    decoration: const InputDecoration(
                      hintText: 'Insert email',
                      prefixIcon: Icon(Icons.location_on_outlined),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'About Order',
              style: AppStyle.h10(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(width: 13.w),
                const Icon(Icons.local_shipping_outlined),
                SizedBox(width: 12.w),
                Text(
                  'Delivery',
                  style: AppStyle.h3(),
                ),
                const Spacer(),
                Text(
                  'Select Method',
                  style: AppStyle.h7(),
                ),
                SizedBox(width: 5.w),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            SizedBox(
              height: 35.h,
              child: const Divider(thickness: 1),
            ),
            Row(
              children: [
                SizedBox(width: 13.w),
                const Icon(Icons.credit_card),
                SizedBox(width: 12.w),
                Text(
                  'Payment Method',
                  style: AppStyle.h3(),
                ),
                const Spacer(),
                SizedBox(width: 5.w),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            SizedBox(
              height: 35.h,
              child: const Divider(thickness: 1),
            ),
            Row(
              children: [
                SizedBox(width: 13.w),
                const Icon(Icons.credit_card),
                SizedBox(width: 12.w),
                Text(
                  'Total Cost',
                  style: AppStyle.h3(),
                ),
                const Spacer(),
                Text(
                  '\$${context.read<IHomeScreenViewModel>().totalCost}',
                  style: AppStyle.price(),
                ),
                SizedBox(width: 5.w),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            SizedBox(height: 70.h),
            CommonButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Get.toNamed(MyRouter.paymentScreen);
                }
              },
              text: 'Confirm Order',
            )
          ],
        ),
      ),
    );
  }
}
