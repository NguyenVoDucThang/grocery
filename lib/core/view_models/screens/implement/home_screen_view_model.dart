import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class HomeScreenViewModel extends ChangeNotifier implements IHomeScreenViewModel {
  final _homeScreenService = locator<IHomeScreenService>();
  String _featuredProduct = 'fruit';

  List<ProductDto>? _listProduct;

  @override
  List<ProductDto>? get products => _listProduct;

  @override
  Future<List<ProductDto>> getListProductByType() async {
    _listProduct = await _homeScreenService.getListProductByType(_featuredProduct);
    notifyListeners();
    return _listProduct ?? [];
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

  @override
  // TODO: implement featuredProduct
  String get featuredProduct => _featuredProduct;

  @override
  void changeFeaturedProduct(String category) {
    _featuredProduct = category;
    getListProductByType();
  }
}