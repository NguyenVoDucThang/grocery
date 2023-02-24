import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/isign_up_service.dart';
import 'package:kid_shop/global/locator.dart';

class SignUpService implements ISignUpService {
  @override
  Future<bool> signUp({required AccountDto accountDto}) async {
    final result = await getRestClient().createAccount(accountDto);

    if (result.response.statusCode == HttpStatus.created)  {
      return true;
    } else {
      return false;
    }
  }

}