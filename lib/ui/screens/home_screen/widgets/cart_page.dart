import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/common_button.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/favorite_product_card.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final ValueNotifier<List<CartEntity>> controller;
  late final ICartPageViewModel _cartPageViewModel;

  @override
  void initState() {
    // TODO: implement initState
    _cartPageViewModel = context.read<ICartPageViewModel>();
    _cartPageViewModel.getCart();
    controller = ValueNotifier(_cartPageViewModel.carts!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        getBack: () => Get.toNamed(MyRouter.homeScreen),
        title: Text(
          'My Cart',
          style: AppStyle.titleAppBar(),
        ),
      ),
      body: Column(
        children: [
          Consumer<ICartPageViewModel>(
            builder: (_, value, __) {
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
                        cartEntity: value.carts![index],
                        quantity: value.carts![index].quantity,
                        isCart: true,
                      );
                    },
                    itemCount: value.carts!.length,
                  ),
                ),
              );
            },

          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
            child: CommonButton(
              onPressed: () {
                if (_cartPageViewModel.carts?.isNotEmpty == true) {
                  Get.toNamed(MyRouter.orderConfirmScreen);
                }
              },
              text: 'Checkout',
            ),
          ),
        ],
      ),
    );
  }
}
