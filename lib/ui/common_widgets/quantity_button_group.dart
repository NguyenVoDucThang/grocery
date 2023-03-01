import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:provider/src/provider.dart';

class QuantityButtonGroup extends StatelessWidget {
  final String id;
  final ValueNotifier<int> controller;
  final double? size;
  final CartEntity cartEntity;
  final bool isCart;

  const QuantityButtonGroup({
    Key? key,
    required this.id,
    required this.controller,
    this.size,
    required this.cartEntity,
    this.isCart = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (controller.value > 1) {
              controller.value--;
            } else {
              if (isCart) {
                context.read<ICartPageViewModel>().removeItem(id);
              }
            }
          },
          child: Image.asset(
            'assets/images/minus.png',
            height: size ?? 24.h,
            width: size ?? 24.w,
          ),
        ),
        SizedBox(width: 5.w),
        ValueListenableBuilder<int>(
          valueListenable: controller,
          builder: (_, value, __) {
            return Text(
              '$value Kg',
              style: TextStyle(fontSize: size),
            );
          },
        ),
        SizedBox(width: 5.w),
        InkWell(
          onTap: () =>  controller.value++,
          child: Image.asset(
            'assets/images/add.png',
            height: size ?? 24.h,
            width: size ?? 24.w,
          ),
        ),
      ],
    );
  }
}
