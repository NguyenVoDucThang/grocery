import 'package:flutter/material.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';

abstract class ISignInViewModel implements ChangeNotifier {
  AccountDto? get accountDto;
  Future<bool> signIn(String username, String password);
}