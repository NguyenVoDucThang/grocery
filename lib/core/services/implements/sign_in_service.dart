import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/isign_in_service.dart';
import 'package:kid_shop/global/locator.dart';

class SignInService implements ISignInService {
  AccountDto? _accountDto;

  @override
  Future<AccountDto?> signIn({
    required String username,
    required String password,
  }) async {
    final users = await getRestClient().getAllUser();

    for (var element in users) {
      if (element.username == username && element.password == password) {
        _accountDto = element;
        break;
      }
    }

    return _accountDto;
  }

  @override
  AccountDto? get accountDto => _accountDto;
}
