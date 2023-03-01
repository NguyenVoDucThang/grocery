import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:kid_shop/core/hive_database/daos/cart_dao.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/global/locator.dart';

class HomeScreenService implements IHomeScreenService {
  final _cartDao = locator<CartDao>();
  List<ProductDto>? _listProduct;

  @override
  Future<List<ProductDto>?> getListProduct() async {
    final listProduct = await getRestClient().getProducts();

    return _listProduct = listProduct;
  }

  @override
  Future<List<ProductDto>> getListProductByType(String category) async {
    List<ProductDto>? products = await getListProduct();

    if (products != null) {
      return products.where((element) => element.category == category).toList();
    } else {
      return [];
    }
  }

  @override
  List<ProductDto>? get listProduct => _listProduct;

  @override
  Future<void> onTapFavoriteButton(ProductDto productDto) async {
    ProductDto newProduct = ProductDto(
      id: productDto.id,
      productName: productDto.productName,
      imageUrl: productDto.imageUrl,
      category: productDto.category,
      price: productDto.price,
      height: productDto.height,
      description: productDto.description,
      numberOfReview: productDto.numberOfReview,
      averagePoint: productDto.averagePoint,
      isFavourite: !productDto.isFavourite,
    );

    await getRestClient().editProduct(newProduct, newProduct.id);
  }

  @override
  Future<List<ProductDto>> getListFavoriteProduct() async {
    List<ProductDto> listFavoriteProduct = await getListProduct() ?? [];

    return listFavoriteProduct =
        listFavoriteProduct.where((element) => element.isFavourite).toList();
  }

  @override
  Future<void> addCart(CartEntity cartEntity) async {
    final result = _cartDao.findById(cartEntity.id ?? '');

    if (result != null) {
      await _cartDao.update(
          cartEntity.id ?? '',
          CartEntity(
            imageUrl: result.imageUrl,
            productName: result.productName,
            weight: result.weight,
            price: result.price,
            quantity: result.quantity + cartEntity.quantity,
          ));
    } else {
      await _cartDao.insert(cartEntity);
    }
    getCarts();
  }

  @override
  List<CartEntity> getCarts() {
    return _cartDao.getAll() == null ? [] : _cartDao.getAll()!;
  }

  @override
  void removeCart(String id) {
    _cartDao.delete(id);
  }

  @override
  void clearCart() {
    _cartDao.clear();
  }
}
