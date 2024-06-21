// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroceryItemModel _$GroceryItemModelFromJson(Map<String, dynamic> json) =>
    GroceryItemModel(
      name: json['name'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      category: $enumDecodeNullable(_$CategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$GroceryItemModelToJson(GroceryItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'category': _$CategoryEnumMap[instance.category],
    };

const _$CategoryEnumMap = {
  Category.vegetables: 0,
  Category.fruit: 1,
  Category.meat: 2,
  Category.dairy: 3,
  Category.carbs: 4,
  Category.sweets: 5,
  Category.spices: 6,
  Category.convenience: 7,
  Category.hygiene: 8,
  Category.other: 9,
};
