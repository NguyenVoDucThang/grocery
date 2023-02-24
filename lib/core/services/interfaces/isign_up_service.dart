import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class ISignUpService {
  Future<bool> signUp({required AccountDto accountDto});
}