import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/shopping_list_server_mapping_usecase.dart';

void main() {
  test(
      'given a map<String, GroceryItemEntity> , converted to List<GroceryItemEntity>',
      () {
    final ShoppingListServerMappingUseCase useCase =
        ShoppingListServerMappingUseCase();

    Map<String, GroceryItemEntity> map = {
      'a': GroceryItemEntity(
          name: "item 1", quantity: 15, category: Category.carbs),
      'b': GroceryItemEntity(
          name: "item 2", quantity: 20, category: Category.dairy),
      'c': GroceryItemEntity(
          name: "item 3", quantity: 22, category: Category.hygiene),
      'd': GroceryItemEntity(
          name: "item 4", quantity: 1, category: Category.fruit),
    };

    List<GroceryItemEntity> groceryItemEntity =
        useCase.convertMapOfGroceryItemsToList(map);

    expect(groceryItemEntity[0].category, Category.carbs);
    expect(groceryItemEntity[1].getKey(), "b");
    expect(groceryItemEntity[2].name, "item 3");
    expect(groceryItemEntity[3].quantity, 1);
  });

  test(
      'given a List<GroceryItemEntity> , when passed to appendCurentShoppingListWithNewItem(), then return a new list with a new item with a new key',
      () {
    final List<GroceryItemEntity> listItems;
    final GroceryItemEntity newListItem;
    final String key;

    listItems = [
      GroceryItemEntity(name: "item 1", quantity: 15, category: Category.carbs),
      GroceryItemEntity(
          name: "item 2", quantity: 22, category: Category.hygiene),
      GroceryItemEntity(name: "item 3", quantity: 22, category: Category.fruit),
    ];

    newListItem = GroceryItemEntity(
        name: "item 4", quantity: 50, category: Category.spices);

    key = "fkdjfd67";

    final ShoppingListServerMappingUseCase useCase =
        ShoppingListServerMappingUseCase();

    List<GroceryItemEntity> resultingList = useCase
        .appendCurentShoppingListWithNewItem(listItems, newListItem, key);

    expect(resultingList.last.category, Category.spices);
    expect(resultingList.last.name, "item 4");
    expect(resultingList.last.quantity, 50);
    expect(resultingList.last.getKey(), key);
  });

  test(
      'given a List<GroceryItemEntity>, and a GroceryItemEntity, delete the GroceryItemEntity from eh list and return resulting list',
      () {
    final List<GroceryItemEntity> listItems;
    final GroceryItemEntity deletedListItem;

    listItems = [
      GroceryItemEntity(name: "item 1", quantity: 15, category: Category.carbs),
      GroceryItemEntity(
          name: "item 2", quantity: 22, category: Category.hygiene),
      GroceryItemEntity(name: "item 3", quantity: 22, category: Category.fruit),
    ];

    listItems[0].setKey("1");
    listItems[1].setKey("2");
    listItems[2].setKey("3");

    deletedListItem = listItems[1];

    final ShoppingListServerMappingUseCase useCase =
        ShoppingListServerMappingUseCase();

    List<GroceryItemEntity> result =
        useCase.removeItemFromList(listItems, deletedListItem);

    expect(result.length, 2);
    expect(result[0].quantity, 15);
    expect(result[1].name, "item 3");
  });
}
