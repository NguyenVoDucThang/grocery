import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kid_shop/core/api/rest_client.dart';

import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  setupRestClient();
  registerServiceSingletons(locator);
}

void setupRestClient() {
  var dio = Dio();
  var baseUrl = 'https://63f5e6f79daf59d1ad7da6cb.mockapi.io/api/';
  try {
    locator.registerLazySingleton(
      () => RestClient(
        dio,
        baseUrl: baseUrl,
      ),
      instanceName: 'RestClient',
    );
  } catch (e) {
    print("Setup Client Errors: ${e.toString()}");
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}
