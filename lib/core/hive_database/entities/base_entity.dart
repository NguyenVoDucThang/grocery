import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class BaseEntity extends HiveObject {
  @HiveField(0)
  String? id;

  BaseEntity({ this.id }) {
    id ??= const Uuid().v4();
  }
}