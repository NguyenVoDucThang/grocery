import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/ui/common_widgets/product_price.dart';
import 'package:kid_shop/ui/common_widgets/quantity_button_group.dart';

class FavoriteProductCard extends StatefulWidget {
  final CartEntity cartEntity;
  final int quantity;

  const FavoriteProductCard({
    Key? key,
    required this.cartEntity,
    required this.quantity,
  }) : super(key: key);

  @override
  State<FavoriteProductCard> createState() => _FavoriteProductCardState();
}

class _FavoriteProductCardState extends State<FavoriteProductCard> {
  late final ValueNotifier<int> _controller;

  @override
  void initState() {
    _controller = ValueNotifier(widget.quantity);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              SizedBox(
                height: Get.width * 0.25,
                width: Get.width * 0.25,
                child: Image.network(
                  widget.cartEntity.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartEntity.productName,
                      style: AppStyle.titleAppBar(),
                    ),
                    Text(
                      widget.cartEntity.height,
                      style: AppStyle.subTitle(),
                    ),
                    SizedBox(height: 2.h),
                    ProductPrice(
                      controller: _controller,
                      price: widget.cartEntity.price,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: QuantityButtonGroup(
                  id: widget.cartEntity.id ?? '',
                  controller: _controller,
                  size: 14,
                  cartEntity: widget.cartEntity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
