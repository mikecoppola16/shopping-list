import 'package:shopping_list_app/core/baseclasses/state_base.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';

abstract class RemoteGroceryState extends BaseState {
  final List<GroceryItemEntity>? groceryListItems;
  //final GroceryItemEntity? newGroceryListItem;

  const RemoteGroceryState(
      {this.groceryListItems, super.error});

  @override
  List<Object> get props => [];
}

class RemoteLoading extends RemoteGroceryState {
  const RemoteLoading();
}

class RemoteSaveGroceryItem extends RemoteGroceryState {
  const RemoteSaveGroceryItem();
}

class RemoteSaveGroceryItemDone extends RemoteGroceryState {
  const RemoteSaveGroceryItemDone(List<GroceryItemEntity> groceryItemEntityList)
      : super(groceryListItems: groceryItemEntityList);
}

class RemoteGrocerySaveNewItemsError extends RemoteGroceryState {
  const RemoteGrocerySaveNewItemsError(Failure error) : super(error: error);
}

class RemoteGroceryListDone extends RemoteGroceryState {
  const RemoteGroceryListDone(List<GroceryItemEntity> groceryItems)
      : super(groceryListItems: groceryItems);
}

class RemoteGroceryListEmpty extends RemoteGroceryState {
  const RemoteGroceryListEmpty() : super();
}

class RemoteGroceryItemsError extends RemoteGroceryState {
  const RemoteGroceryItemsError(Failure error) : super(error: error);
}

class RemoteGroceryItemsDeleteError extends RemoteGroceryState {
  const RemoteGroceryItemsDeleteError(List<GroceryItemEntity> groceryItems)
      : super(groceryListItems: groceryItems);
}

class RemoteGroceryItemsDeleteDone extends RemoteGroceryState {
  const RemoteGroceryItemsDeleteDone(List<GroceryItemEntity> groceryItems)
      : super(groceryListItems: groceryItems);
}

