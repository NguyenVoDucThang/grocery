import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  String get featuredProduct;
  List<ProductDto>? get products;
  Future<List<ProductDto>> getListProductByType();
  Future<List<ProductDto>> getListProduct();
  Future<void> onTapFavoriteButton(ProductDto productDto);
  void changeFeaturedProduct(String category);
}