import 'package:flutter/cupertino.dart';

abstract class IHomeScreenViewModel implements ChangeNotifier {
  String get name;
  void getStarted();
}