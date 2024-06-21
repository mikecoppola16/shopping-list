// ignore_for_file: must_be_immutable

import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';

part 'grocery_item_model.g.dart';

@JsonSerializable()
class GroceryItemModel extends GroceryItemEntity {
  GroceryItemModel({
    super.name,
    super.quantity,
    super.category,
  });

  factory GroceryItemModel.fromJson(Map<String, dynamic> data) =>
      _$GroceryItemModelFromJson(data);
  Map<String, dynamic> toJson() => _$GroceryItemModelToJson(this);
}
