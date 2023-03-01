import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class IAuthenticationService {
  Future<bool> signUp({required AccountDto accountDto});
  Future<AccountDto?> signIn({required String username, required String password});
}