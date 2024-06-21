import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:shopping_list_app/core/extension/http.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/features/shopping_list/data/data_sources/remote/shopping_list_api_service.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/error_handler.dart';
import 'package:shopping_list_app/core/baseclasses/repository_base.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/domain/repository_contracts/grocery_item_repository.dart';

class GroceryItemRepositoryImpl extends BaseRepository
    implements GroceryItemRepository {
  final ShoppingListApiService _shoppingListApiService;

  GroceryItemRepositoryImpl(this._shoppingListApiService);

  @override
  Future<Either<Failure, Map<String, GroceryItemEntity>>>
      getShoppingListItems() async {
    try {
      final httpResponse = await _shoppingListApiService.getShoppingListItems();
      if (httpResponse.statusCode() == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(nullCheckFailure(
            httpResponse.statusCode(), httpResponse.statusMessage()));
      }
    } catch (e) {
      return (Left(ErrorHandler.handle(e).failure));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>>> saveShoppingListItem(
      GroceryItemEntity groceryItemEntity) async {
    try {
      final httpResponse = await _shoppingListApiService.saveShoppingListItem(
          GroceryItemModel(
              name: groceryItemEntity.name,
              quantity: groceryItemEntity.quantity,
              category: groceryItemEntity.category));

      if (httpResponse.statusCode() == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(nullCheckFailure(
            httpResponse.statusCode(), httpResponse.statusMessage()));
      }
    } catch (e) {
      return (Left(ErrorHandler.handle(e).failure));
    }
  }

  @override
  Future<Either<Failure, String>> deleteShoppingListItem(
      GroceryItemEntity groceryItemEntity) async {
    try {
      final httpResponse = await _shoppingListApiService
          .deleteShoppingListItem(groceryItemEntity.getKey());

      if (httpResponse.statusCode() == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(nullCheckFailure(
            httpResponse.statusCode(), httpResponse.statusMessage()));
      }
    } catch (e) {
      return (Left(ErrorHandler.handle(e).failure));
    }
  }
}
