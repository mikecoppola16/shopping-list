// ignore_for_file: void_checks

import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/delete_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/get_shopping_list_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/save_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/shopping_list_server_mapping_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_event.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_state.dart';

class RemoteGroceryItemsBloc
    extends Bloc<RemoteGroceryListItemsEvent, RemoteGroceryState> {
  final GetShoppingListUseCase _getGroceryItemsUseCase;
  final SaveShoppingListItemUseCase _saveGroceryItemsUseCase;
  final DeleteShoppingListItemUseCase _deleteGroceryItemsUseCase;
  final ShoppingListServerMappingUseCase _shoppingListMappingUseCase;

  RemoteGroceryItemsBloc(
    this._getGroceryItemsUseCase,
    this._saveGroceryItemsUseCase,
    this._shoppingListMappingUseCase,
    this._deleteGroceryItemsUseCase,
  ) : super(const RemoteLoading()) {
    on<LoadGroceryListItems>(
      (event, emit) async {
        final dataState = await _getGroceryItemsUseCase.execute(Void);

        if (dataState.isLeft) {
          emit(const RemoteGroceryListEmpty());
        } else {
          if (dataState.right.isNotEmpty) {
            var listWithKeyValues = _shoppingListMappingUseCase
                .convertMapOfGroceryItemsToList(dataState.right);

            emit(RemoteGroceryListDone(listWithKeyValues));
          } else {
            emit(const RemoteGroceryListEmpty());
          }
        }
      },
    );

    on<SaveGroceryListItem>(
      (event, emit) async {
        var savedCurrentList = state.groceryListItems;

        emit(const RemoteLoading());

        final dataState =
            await _saveGroceryItemsUseCase.execute(event.groceryItemModel);

        if (dataState.isLeft) {
          emit(RemoteGrocerySaveNewItemsError(dataState.left));
        } else {
          var updatedList =
              _shoppingListMappingUseCase.appendCurentShoppingListWithNewItem(
                  savedCurrentList,
                  event.groceryItemModel,
                  dataState.right.entries.first.value);

          emit(RemoteSaveGroceryItemDone(updatedList));
        }
      },
    );

    on<DeleteGroceryListItem>(
      (event, emit) async {
        var savedCurrentList = state.groceryListItems;
        emit(const RemoteLoading());

        await Future.delayed(const Duration(milliseconds: 250));

        final dataState =
            await _deleteGroceryItemsUseCase.execute(event.groceryItemEntity);

        if (dataState.isLeft) {
          emit(RemoteGroceryItemsDeleteError(savedCurrentList!));
        } else {
          var updatedList = _shoppingListMappingUseCase.removeItemFromList(
              savedCurrentList!, event.groceryItemEntity);
          emit(RemoteGroceryListDone(updatedList));
        }
      },
    );
  }
}     

