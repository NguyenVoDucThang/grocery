import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class IAuthenticationViewModel implements ChangeNotifier {
  AccountDto? get accountDto;
  Future<bool> signIn(String username, String password);
  Future<bool> signUp(AccountDto accountDto);
  void signOut();
}