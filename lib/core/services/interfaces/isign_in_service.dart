import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class ISignInService {
  AccountDto? get accountDto;
  Future<AccountDto?> signIn({required String username, required String password});
}