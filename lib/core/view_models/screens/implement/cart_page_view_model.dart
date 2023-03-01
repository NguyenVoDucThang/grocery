import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class CartPageViewModel extends ChangeNotifier implements ICartPageViewModel {
  final _homeScreenService = locator<IHomeScreenService>();

  List<CartEntity>? _carts;

  @override
  List<CartEntity>? get carts => _carts;

  @override
  void getCart() {
    _carts = _homeScreenService.getCarts();
  }

  @override
  void removeItem(String id) {
    _homeScreenService.removeCart(id);
    if (_carts!.isNotEmpty == true) {
      _carts!.removeWhere((element) => element.id == id);
    }
    notifyListeners();
  }
}