import 'dart:core';

import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';

abstract class IHomeScreenService {
  List<CartEntity>? get carts;
  List<ProductDto>? get listProduct;
  Future<List<ProductDto>?> getListProduct();
  Future<List<ProductDto>> getListProductByType(String type);
  Future<void> onTapFavoriteButton(ProductDto productDto);
  Future<List<ProductDto>> getListFavoriteProduct();
  List<CartEntity> getCarts();
  Future<void> addCart(CartEntity cartEntity);
  void removeCart(String id);
}