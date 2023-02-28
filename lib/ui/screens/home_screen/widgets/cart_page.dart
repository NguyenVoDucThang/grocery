import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/favorite_product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: Text(
          'My Cart',
          style: AppStyle.titleAppBar(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FavoriteProductCard(
                    cartEntity:
                        locator.get<IHomeScreenService>().getCarts()[index],
                    quantity: locator
                        .get<IHomeScreenService>()
                        .getCarts()[index]
                        .quantity,
                  );
                },
                itemCount: locator.get<IHomeScreenService>().getCarts().length,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
            child: CommonButton(
              onPressed: () => Get.toNamed(MyRouter.orderConfirmScreen),
              text: 'Checkout',
            ),
          ),
        ],
      ),
    );
  }
}
