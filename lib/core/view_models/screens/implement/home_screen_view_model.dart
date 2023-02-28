import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class HomeScreenViewModel extends ChangeNotifier implements IHomeScreenViewModel {
  final _homeScreenService = locator<IHomeScreenService>();
  final int _numberOfAddedProduct = 0;
  double _totalCost = 0;

  List<ProductDto>? _listProduct;

  @override
  List<ProductDto>? get products => _listProduct;

  @override
  Future<List<ProductDto>> getListProductByType(String type) async {
    _listProduct = await _homeScreenService.getListProductByType(type);

    return _listProduct ?? [];
  }

  double getTotalCart() {
    _homeScreenService.getCarts().forEach((element) => _totalCost += element.price);

    return _totalCost;
  }

  @override
  int get numberOfAddedProduct => _numberOfAddedProduct;

  @override
  double get totalCost => _totalCost;
}