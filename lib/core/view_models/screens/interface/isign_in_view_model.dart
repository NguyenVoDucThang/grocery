import 'package:flutter/material.dart';

abstract class ISignInViewModel implements ChangeNotifier {
  Future<bool> signIn(String username, String password);
}