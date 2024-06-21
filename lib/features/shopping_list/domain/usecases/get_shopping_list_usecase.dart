import 'package:either_dart/either.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/core/baseclasses/usecase_base.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/domain/repository_contracts/grocery_item_repository.dart';

class GetShoppingListUseCase implements BaseUseCase<void, Map<String,GroceryItemEntity>> {
  final GroceryItemRepository _shoppingListRepository;

  GetShoppingListUseCase(this._shoppingListRepository);
  
  @override
  Future<Either<Failure, Map<String,GroceryItemEntity> >> execute(void input) {
     return _shoppingListRepository.getShoppingListItems();
  }
  
}
