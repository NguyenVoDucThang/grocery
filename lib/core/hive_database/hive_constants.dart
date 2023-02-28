import 'package:hive/hive.dart';
import 'package:kid_shop/core/hive_database/entities/cart_entity/cart_entity.dart';

class HiveBoxName {
  static const String cart = 'cart'; //1

}

class HiveBoxMap {
  static Map<Type, MyHive> hiveBoxMap = {
    CartEntity: MyHive<CartEntity>(
      boxName: HiveBoxName.cart,
      registerAdapterFunction: () {
        Hive.registerAdapter(CartEntityAdapter());
      },
    ),
  };
}

class MyHive<EntityT> {
  String boxName;
  Future<void> Function()? openBoxFunction;
  void Function() registerAdapterFunction;

  MyHive({
    required this.boxName,
    required this.registerAdapterFunction,
  }){
    openBoxFunction =  () async {
      await Hive.openBox<EntityT>(boxName);
    };
  }
}