import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/favorite_product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final ValueNotifier<List<CartEntity>> controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = ValueNotifier(locator.get<IHomeScreenService>().carts!);
    super.initState();
  }

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
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (_, List<CartEntity> value, __) {
              return Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.h,
                    vertical: 10.w,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FavoriteProductCard(
                        cartEntity: value[index],
                        quantity: value[index].quantity,
                      );
                    },
                    itemCount: value.length,
                  ),
                ),
              );
            },
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
