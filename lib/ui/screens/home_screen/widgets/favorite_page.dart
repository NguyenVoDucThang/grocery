import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:kid_shop/core/constants/app_style.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/global/locator.dart';
import 'package:kid_shop/ui/common_widgets/custom_app_bar.dart';
import 'package:kid_shop/ui/common_widgets/favorite_product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Favorite',
          style: AppStyle.titleAppBar(),
        ),
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.w),
        child: FutureBuilder(
          future: locator.get<IHomeScreenService>().getListFavoriteProduct(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ProductDto>> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error));
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FavoriteProductCard(
                      cartEntity: CartEntity(
                        imageUrl: snapshot.data![index].imageUrl,
                        productName: snapshot.data![index].productName,
                        height: snapshot.data![index].height.toString(),
                        price: snapshot.data![index].price,
                        quantity: 0,
                      ),
                      quantity: 0,
                    );
                  },
                  itemCount: snapshot.data == null ? 0 : snapshot.data!.length,
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: 30.w,
                  height: 30.w,
                  child: const CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
