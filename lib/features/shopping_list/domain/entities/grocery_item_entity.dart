// ignore_for_file: must_be_immutable, unused_field

import 'package:equatable/equatable.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';

class GroceryItemEntity extends Equatable {
  final String? name;
  final int? quantity;
  final Category? category;

  late String _key;

  String getKey(){
    return _key;
  }

  setKey(String key) {
    _key = key;
  }

  GroceryItemEntity(
      {required this.name, required this.quantity, required this.category});

  String get testNameGetter => "$name test";

  @override
  List<Object?> get props {
    return [name, quantity, category];
  }
}