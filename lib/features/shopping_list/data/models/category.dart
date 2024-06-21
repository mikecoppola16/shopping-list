import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

enum Category {
  @JsonValue(0)
  vegetables('Vegetables',Color.fromARGB(255, 0, 255, 128)),
  @JsonValue(1)
  fruit('Fruit',Color.fromARGB(255, 145, 255, 0)),
  @JsonValue(2)
  meat('Meat',Color.fromARGB(255, 0, 208, 255)),
  @JsonValue(3)
  dairy('Dairy',Color.fromARGB(255, 0, 60, 255)),
  @JsonValue(4)
  carbs('Carbs',Color.fromARGB(255, 128, 22, 45)),
  @JsonValue(5)
  sweets('Sweets',Color.fromARGB(255, 255, 149, 0)),
  @JsonValue(6)
  spices('Spices',Color.fromARGB(255, 42, 40, 39)),
  @JsonValue(7)
  convenience('Convenience',Color.fromARGB(255, 255, 187, 0)),
  @JsonValue(8)
  hygiene('Hygiene',Color.fromARGB(255, 191, 0, 255)),
  @JsonValue(9)
  other('Other',Color.fromARGB(255, 149, 0, 255));
  
  const Category(this.title, this.color);
  final String title;
  final Color color;

}