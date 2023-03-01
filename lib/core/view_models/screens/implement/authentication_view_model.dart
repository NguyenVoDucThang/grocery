import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/iauthentication_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/iauthentication_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class AuthenticationViewModel extends ChangeNotifier
    implements IAuthenticationViewModel {
  final _authenticationService = locator<IAuthenticationService>();

  AccountDto? _accountDto;

  @override
  AccountDto? get accountDto => _accountDto;

  @override
  Future<bool> signIn(String username, String password) async {
    final account = await _authenticationService.signIn(
      username: username,
      password: password,
    );
    _accountDto = account;

    return account != null;
  }

  @override
  Future<bool> signUp(AccountDto accountDto) async {
    return await _authenticationService.signUp(accountDto: accountDto);
  }

  @override
  void signOut() {
    _accountDto = null;
  }
}
