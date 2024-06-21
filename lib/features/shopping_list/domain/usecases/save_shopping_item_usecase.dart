import 'package:either_dart/either.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/core/baseclasses/usecase_base.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/domain/repository_contracts/grocery_item_repository.dart';

class SaveShoppingListItemUseCase implements BaseUseCase<GroceryItemModel, Map<String,String> > {
  final GroceryItemRepository _shoppingListRepository;

  SaveShoppingListItemUseCase(this._shoppingListRepository);
  
  @override
  Future<Either<Failure, Map<String,String> >> execute(GroceryItemModel groceryItem) {

     return _shoppingListRepository.saveShoppingListItem(groceryItem);
  }
}
