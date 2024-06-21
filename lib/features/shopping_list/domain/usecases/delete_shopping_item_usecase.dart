import 'package:either_dart/either.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/core/baseclasses/usecase_base.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/domain/repository_contracts/grocery_item_repository.dart';

class DeleteShoppingListItemUseCase
    implements BaseUseCase<GroceryItemModel, String> {
  final GroceryItemRepository _shoppingListRepository;

  DeleteShoppingListItemUseCase(this._shoppingListRepository);

  @override
  Future<Either<Failure, String>> execute(GroceryItemEntity groceryItemEntity) {
    return _shoppingListRepository.deleteShoppingListItem(groceryItemEntity);
  }
}
