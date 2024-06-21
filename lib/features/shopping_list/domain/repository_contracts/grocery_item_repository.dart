import 'package:either_dart/either.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';


abstract class GroceryItemRepository {
  ///API Methods
  Future<Either<Failure, Map<String, GroceryItemEntity>>>
      getShoppingListItems();
  Future<Either<Failure, Map<String, String>>> saveShoppingListItem(
      GroceryItemEntity groceryItem);

  Future<Either<Failure, String>> deleteShoppingListItem(
      GroceryItemEntity groceryItem);

  //Database Methods
  //TODO
}
