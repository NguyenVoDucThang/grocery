import 'package:kid_shop/core/view_models/screens/implement/authentication_view_model.dart';
import 'package:kid_shop/core/view_models/screens/implement/cart_page_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/iauthentication_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/icart_page_view_model.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/view_models/screens/implement/home_screen_view_model.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IHomeScreenViewModel>(
    create: (_) => HomeScreenViewModel(),
  ),
  ChangeNotifierProvider<IAuthenticationViewModel>(
    create: (_) => AuthenticationViewModel(),
  ),
  ChangeNotifierProvider<ICartPageViewModel>(
    create: (_) => CartPageViewModel(),
  ),
];
