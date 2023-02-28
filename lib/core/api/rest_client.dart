import 'package:dio/dio.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/dtos/product/product_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://63f5e6f79daf59d1ad7da6cb.mockapi.io/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/user")
  Future<HttpResponse> createAccount(@Body() AccountDto accountDto);

  @GET("/user")
  Future<List<AccountDto>> getAllUser();

  @GET("/product")
  Future<List<ProductDto>> getProducts();

  @PUT("/product/{id}")
  Future<ProductDto> editProduct(
    @Body() ProductDto productDto,
    @Path("id") String id,
  );
}
