import 'package:get_it/get_it.dart';
import 'package:kid_shop/core/hive_database/daos/cart_dao.dart';

void registerDaoSingletons(GetIt locator) {
  locator.registerLazySingleton(() => CartDao());
}