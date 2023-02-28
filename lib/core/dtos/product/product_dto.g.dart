// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['id'] as String,
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      description: json['description'] as String,
      numberOfReview: (json['numberOfReview'] as num).toDouble(),
      averagePoint: (json['averagePoint'] as num).toDouble(),
      isFavourite: json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'category': instance.category,
      'price': instance.price,
      'height': instance.height,
      'description': instance.description,
      'numberOfReview': instance.numberOfReview,
      'averagePoint': instance.averagePoint,
      'imageUrl': instance.imageUrl,
      'isFavourite': instance.isFavourite,
    };
