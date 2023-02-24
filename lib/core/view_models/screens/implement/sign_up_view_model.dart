import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/dtos/account/account_dto.dart';
import 'package:kid_shop/core/services/interfaces/isign_up_service.dart';
import 'package:kid_shop/core/view_models/screens/interface/isign_up_view_model.dart';
import 'package:kid_shop/global/locator.dart';

class SignUpViewModel extends ChangeNotifier implements ISignUpViewModel {
  final _signUpService = locator<ISignUpService>();

  @override
  Future<bool> signUp(AccountDto accountDto) async {
    return await _signUpService.signUp(accountDto: accountDto);
  }
}
