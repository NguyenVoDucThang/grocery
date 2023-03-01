import 'package:hive/hive.dart';
import 'package:kid_shop/core/hive_database/entities/base_entity.dart';

part 'cart_entity.g.dart';

@HiveType(typeId: 1)
class CartEntity extends BaseEntity {
  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String productName;

  @HiveField(3)
  final String weight;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final int quantity;

  double get totalPrice => quantity * price;

  CartEntity({
    String? id,
    required this.imageUrl,
    required this.productName,
    required this.weight,
    required this.price,
    required this.quantity,
  }) : super(id: id);
}
