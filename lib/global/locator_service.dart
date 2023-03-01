import 'package:get_it/get_it.dart';
import 'package:kid_shop/core/services/implements/authentication_service.dart';
import 'package:kid_shop/core/services/implements/home_screen_service.dart';
import 'package:kid_shop/core/services/interfaces/iauthentication_service.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAuthenticationService>(() => AuthenticationService());
  locator.registerLazySingleton<IHomeScreenService>(() => HomeScreenService());
}
