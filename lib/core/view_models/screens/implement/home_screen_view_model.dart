import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class HomeScreenViewModel extends ChangeNotifier implements IHomeScreenViewModel {
  final _homeScreenService = locator<IHomeScreenService>();

  List<ProductDto>? _listProduct;

  @override
  List<ProductDto>? get products => _listProduct;

  @override
  Future<List<ProductDto>> getListProductByType(String type) async {
    return await _homeScreenService.getListProductByType(type);
  }

  double getTotalCart() {
    double _totalCost = 0;

    _homeScreenService.getCarts().forEach((element) => _totalCost += element.price);

    return _totalCost;
  }

  @override
  Future<List<ProductDto>> getListProduct() async {
    _listProduct = await _homeScreenService.getListProduct() ?? [];
    notifyListeners();
    return _listProduct ?? [];
  }

  @override
  Future<void> onTapFavoriteButton(ProductDto productDto) async {
    await _homeScreenService.onTapFavoriteButton(productDto);
    var temp = _listProduct!.firstWhere((element) => element.id == productDto.id);
    temp.isFavorite = !temp.isFavorite;
    notifyListeners();
  }
}