import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  List<ProductDto>? get products;
  Future<List<ProductDto>> getListProductByType(String type);
  Future<List<ProductDto>> getListProduct();
  Future<void> onTapFavoriteButton(ProductDto productDto);
}