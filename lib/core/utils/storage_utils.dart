import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageUtil {
  ///directory especially for this app
  static Future<Directory> getApplicationPermanentDirectory() async {
    var storage = await getExternalStorageDirectory();
    var permanentFolder = Directory(storage!.path + '/pax_stock_app');
    if (!permanentFolder.existsSync()) permanentFolder.createSync();
    return permanentFolder;
  }
}