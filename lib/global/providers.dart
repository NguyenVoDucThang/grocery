import 'package:kid_shop/core/view_models/screens/implement/sign_in_view_model.dart';
import 'package:kid_shop/core/view_models/screens/implement/sign_up_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/isign_in_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/isign_up_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/view_models/screens/implement/home_screen_view_model.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IHomeScreenViewModel>(
    create: (_) => HomeScreenViewModel(),
  ),
  ChangeNotifierProvider<ISignInViewModel>(
    create: (_) => SignInViewModel(),
  ),
  ChangeNotifierProvider<ISignUpViewModel>(
    create: (_) => SignUpViewModel(),
  ),
];
