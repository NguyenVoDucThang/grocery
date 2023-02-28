import 'package:flutter/material.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/isign_in_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/isign_in_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class SignInViewModel extends ChangeNotifier implements ISignInViewModel {
  final _signInService = locator<ISignInService>();
  AccountDto? _accountDto;
  @override
  Future<bool> signIn(String username, String password) async {
    final account = await _signInService.signIn(username: username, password: password);
    _accountDto = account;

    return account != null;
  }

  @override
  AccountDto? get accountDto => _accountDto;
}
