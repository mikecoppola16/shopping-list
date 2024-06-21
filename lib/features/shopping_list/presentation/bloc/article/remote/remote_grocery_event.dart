import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';

abstract class RemoteGroceryListItemsEvent {
  const RemoteGroceryListItemsEvent();
}

class LoadGroceryListItems extends RemoteGroceryListItemsEvent {
  LoadGroceryListItems();
}

class SaveGroceryListItem extends RemoteGroceryListItemsEvent {
  final GroceryItemModel groceryItemModel;
  SaveGroceryListItem(this.groceryItemModel);
}

class DeleteGroceryListItem extends RemoteGroceryListItemsEvent {
  final GroceryItemEntity groceryItemEntity;
  DeleteGroceryListItem(this.groceryItemEntity);
}