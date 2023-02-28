import 'package:flutter/material.dart';
import 'package:kid_shop/core/constants/app_style.dart';

class ProductPrice extends StatelessWidget {
  final ValueNotifier<int> controller;
  final double price;

  const ProductPrice({
    Key? key,
    required this.controller,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller,
      builder: (_,value,__) {
        return Text(
          '\$${price * value}',
          style: AppStyle.h6().copyWith(fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
