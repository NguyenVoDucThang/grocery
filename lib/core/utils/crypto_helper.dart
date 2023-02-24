import 'dart:convert';

import 'package:crypto/crypto.dart';

class CryptoHelper {
  static String generatedMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}