import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';

class ShoppingListServerMappingUseCase {
  List<GroceryItemEntity> convertMapOfGroceryItemsToList(
      Map<String, GroceryItemEntity> mapItems,
      [String keyFromAddItem = ""]) {
    List<GroceryItemEntity> listItems = [];

    mapItems.forEach((k, v) {
      var groceryItemEntity = GroceryItemEntity(
          name: v.name, quantity: v.quantity, category: v.category);
      groceryItemEntity.setKey(keyFromAddItem.isEmpty ? k : keyFromAddItem);

      listItems.add(groceryItemEntity);
    });

    return listItems;
  }

  List<GroceryItemEntity> appendCurentShoppingListWithNewItem(
      List<GroceryItemEntity>? fullList, GroceryItemEntity newListItem, String newItemKey) {
    List<GroceryItemEntity> listToReturn = [];
    
    newListItem.setKey(newItemKey);
   
    if (fullList != null) {
      fullList.add(newListItem);
      listToReturn = fullList;
    } else {
      listToReturn.add(newListItem);
    }
    return listToReturn;
  }

  List<GroceryItemEntity> removeItemFromList(List<GroceryItemEntity> fullList, GroceryItemEntity deletedListItem){

      fullList.removeWhere((GroceryItemEntity item) => item.getKey() == deletedListItem.getKey());

      return fullList;

  }
}
