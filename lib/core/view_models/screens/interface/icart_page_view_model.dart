import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';

abstract class ICartPageViewModel implements ChangeNotifier{
  List<CartEntity>? get carts;
  void removeItem(String id);
  void getCart();
}