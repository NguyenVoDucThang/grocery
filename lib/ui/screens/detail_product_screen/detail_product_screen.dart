import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:kid_shop/core/constants/app_colors.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/global/router.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/favorite_button.dart';
import 'package:kid_shop/ui/common_widgets/product_price.dart';
import 'package:kid_shop/ui/common_widgets/quantity_button_group.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class DetailProductScreen extends StatefulWidget {
  final ProductDto productDto;

  const DetailProductScreen({Key? key, required this.productDto})
      : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  late final ValueNotifier<int> _quantityController;
  final productService = locator<IHomeScreenService>();

  @override
  void initState() {
    _quantityController = ValueNotifier(1);

    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBar: AppBar(),
        actions: [
          Consumer<IHomeScreenViewModel>(
            builder: (_, value, __) {
              return FavoriteButton(
                isFavorite: value.products!
                    .firstWhere((element) => element.id == widget.productDto.id)
                    .isFavorite,
                onTapFavorite: () => context
                    .read<IHomeScreenViewModel>()
                    .onTapFavoriteButton(widget.productDto),
              );
            },
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(widget.productDto.imageUrl)),
            Row(
              children: [
                Text(
                  widget.productDto.productName,
                  style: AppStyle.h1(),
                ),
                const Spacer(),
                QuantityButtonGroup(
                  controller: _quantityController,
                  id: widget.productDto.id,
                  cartEntity: CartEntity(
                    imageUrl: widget.productDto.imageUrl,
                    productName: widget.productDto.productName,
                    weight: widget.productDto.height.toString(),
                    price: widget.productDto.price,
                    quantity: 0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Text(widget.productDto.category),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  '${widget.productDto.averagePoint}',
                  style: AppStyle.h7(),
                ),
                Text(
                  ' (${widget.productDto.numberOfReview} reviews)',
                  style: AppStyle.h3(),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            ProductPrice(
              controller: _quantityController,
              price: widget.productDto.price,
            ),
            SizedBox(height: 20.h),
            Text(
              'Descriptions',
              style: AppStyle.h2(),
            ),
            SizedBox(height: 10.h),
            Text(
              widget.productDto.description,
              style: AppStyle.h3(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    await productService.addCart(
                      CartEntity(
                        imageUrl: widget.productDto.imageUrl,
                        productName: widget.productDto.productName,
                        weight: widget.productDto.height.toString(),
                        price: widget.productDto.price,
                        quantity: _quantityController.value,
                        id: widget.productDto.id,
                      ),
                    );
                    _quantityController.value = 1;
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.shopping_cart_outlined),
                      Text(' Add to cart'),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryGreen)),
                  onPressed: () async {
                    await productService.addCart(
                      CartEntity(
                        imageUrl: widget.productDto.imageUrl,
                        productName: widget.productDto.productName,
                        weight: widget.productDto.height.toString(),
                        price: widget.productDto.price,
                        quantity: _quantityController.value,
                        id: widget.productDto.id,
                      ),
                    );

                    Get.toNamed(MyRouter.cartScreen);
                  },
                  child: Text(
                    'Buy Now',
                    style: AppStyle.h8(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
