import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';

class GroceryItemModelLocal{
      String id;
      String name;
      int quantity;
      Category category;

      GroceryItemModelLocal( {required this.id,required this.name, required this.quantity, required this.category });

}