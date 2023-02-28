import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  List<ProductDto>? get products;
  int get numberOfAddedProduct;
  Future<List<ProductDto>> getListProductByType(String type);
  double get totalCost;
}