import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class ISignUpViewModel implements ChangeNotifier {
  Future<bool> signUp(AccountDto accountDto);
}