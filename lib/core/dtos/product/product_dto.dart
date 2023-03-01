import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto {
  final String id;
  final String productName;
  final String category;
  final double price;
  final double height;
  final String description;
  final double numberOfReview;
  final double averagePoint;
  final String imageUrl;
  bool isFavorite;

  ProductDto({
    required this.id,
    required this.productName,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.height,
    required this.description,
    required this.numberOfReview,
    required this.averagePoint,
    this.isFavorite = false,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
