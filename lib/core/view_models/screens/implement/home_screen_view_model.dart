import 'package:flutter/cupertino.dart';
import 'package:kid_shop/core/view_models/screens/interface/ihome_screen_view_model.dart';

class HomeScreenViewModel extends ChangeNotifier implements IHomeScreenViewModel {
  final String _name = '';

  @override
  // TODO: implement name
  String get name => _name;

  void getStart() {}

  @override
  void getStarted() {
    // TODO: implement getStarted
  }
}