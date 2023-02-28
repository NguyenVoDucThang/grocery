import 'package:get_it/get_it.dart';
import 'package:kid_shop/core/services/implements/home_screen_service.dart';
import 'package:kid_shop/core/services/implements/sign_in_service.dart';
import 'package:kid_shop/core/services/implements/sign_up_service.dart';
import 'package:kid_shop/core/services/interfaces/ihome_screen_service.dart';
import 'package:kid_shop/core/services/interfaces/isign_in_service.dart';
import 'package:kid_shop/core/services/interfaces/isign_up_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<ISignInService>(() => SignInService());
  locator.registerLazySingleton<ISignUpService>(() => SignUpService());
  locator.registerLazySingleton<IHomeScreenService>(() => HomeScreenService());
}
