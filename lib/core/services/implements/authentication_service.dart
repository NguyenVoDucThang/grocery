import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/iauthentication_service.dart';
import 'package:kid_shop/global/locator.dart';

class AuthenticationService implements IAuthenticationService {
  @override
  Future<AccountDto?> signIn({
    required String username,
    required String password,
  }) async {
    final users = await getRestClient().getAllUser();

    for (var element in users) {
      if (element.username == username && element.password == password) {
        return element;
      }
    }
  }

  @override
  Future<bool> signUp({required AccountDto accountDto}) async {
    final result = await getRestClient().createAccount(accountDto);

    if (result.response.statusCode == HttpStatus.created) {
      return true;
    } else {
      return false;
    }
  }
}
