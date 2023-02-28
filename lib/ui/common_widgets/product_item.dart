import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/favorite_button.dart';

class ProductItem extends StatefulWidget {
  final ProductDto productDto;

  const ProductItem({
    Key? key,
    required this.productDto,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late final ValueNotifier<bool> _controller;
  final productService = locator<IHomeScreenService>();

  @override
  void initState() {
    _controller = ValueNotifier(widget.productDto.isFavourite);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => Get.toNamed(
            MyRouter.detailProductScreen,
            arguments: widget.productDto,
          ),
          child: SizedBox(
            width: Get.width * 0.45,
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.red[200],
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.h,
                          vertical: 3.w,
                        ),
                        child: const Text(
                          '-16%',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const Spacer(),
                      FavoriteButton(
                        controller: _controller,
                        onTapFavorite: () => productService
                            .onTapFavoriteButton(widget.productDto),
                      ),
                      SizedBox(width: 5.w),
                    ],
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.width * 0.25,
                    child: Image.network(
                      widget.productDto.imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    '\$${widget.productDto.price}',
                    style: AppStyle.productName(),
                  ),
                  Text(
                    widget.productDto.productName,
                    style: AppStyle.titleAppBar(),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${widget.productDto.height}',
                    style: AppStyle.h3(),
                  ),
                  const Spacer(),
                  Text(
                    '------------------------------------',
                    style: TextStyle(color: AppColors.primaryGreen),
                  ),
                  Text(
                    'Add to cart',
                    style: AppStyle.h6(),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          right: 7.h,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () async {
                await locator.get<IHomeScreenService>().addCart(
                  CartEntity(
                    imageUrl: widget.productDto.imageUrl,
                    productName: widget.productDto.productName,
                    height: widget.productDto.height.toString(),
                    price: widget.productDto.price,
                    quantity: 1,
                    id: widget.productDto.id,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
