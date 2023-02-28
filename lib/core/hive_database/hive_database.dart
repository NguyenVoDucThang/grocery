import 'package:hive/hive.dart';
import 'package:kid_shop/core/utils/storage_utils.dart';

import 'entities/base_entity.dart';
import 'hive_constants.dart';

class HiveDatabase {
  HiveDatabase();

  Future<void> init() async {
    var appFolder = await StorageUtil.getApplicationPermanentDirectory();
    var hivePath = appFolder.path + '/hive';

    Hive.init(hivePath);
    _registerAdapters();
    await _initBoxes();
  }

  void _registerAdapters() {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      HiveBoxMap.hiveBoxMap[key]!.registerAdapterFunction();
    }
  }

  Box<T> getMyBox<T extends BaseEntity>() {
    return Hive.box<T>(HiveBoxMap.hiveBoxMap[T]!.boxName);
  }

  Future<void> _initBoxes() async {
    for (var key in HiveBoxMap.hiveBoxMap.keys) {
      await HiveBoxMap.hiveBoxMap[key]!.openBoxFunction!();
    }
  }


}