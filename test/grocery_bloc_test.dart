// ignore_for_file: unused_local_variable, void_checks

import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/category.dart';
import 'package:shopping_list_app/features/shopping_list/domain/entities/grocery_item_entity.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/delete_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/get_shopping_list_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/save_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/shopping_list_server_mapping_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_bloc.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_event.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_state.dart';

class MockGetListsUseCase extends Mock implements GetShoppingListUseCase {}

class MockSaveShoppingListItemUseCase extends Mock
    implements SaveShoppingListItemUseCase {}

class MockDeleteShoppingListItemUseCase extends Mock
    implements DeleteShoppingListItemUseCase {}

class MockShoppingListServerMappingUseCase extends Mock
    implements ShoppingListServerMappingUseCase {}

void main() {
  final mockGetListsUseCase = MockGetListsUseCase();
  final mockSaveShoppingListItemUseCase = MockSaveShoppingListItemUseCase();
  final mockDeleteShoppingListItemUseCase = MockDeleteShoppingListItemUseCase();
  final mockShoppingListServerMappingUseCase =
      MockShoppingListServerMappingUseCase();

  group('RemoteGroceryItemsBloc', () {
    //when(() => mockGetListsUseCase.execute(Void)).thenAnswer((_) async => const Right(<ResultSearch>[])).right;

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

    final listToReturn = map.values.toList();

    when(() => mockGetListsUseCase.execute(Void))
        .thenAnswer((_) async => Right(map));
    when(() => mockShoppingListServerMappingUseCase
        .convertMapOfGroceryItemsToList(map)).thenReturn(listToReturn);

    blocTest(
      'sucess state of LoadGroceryListItems',
      build: () => RemoteGroceryItemsBloc(
          mockGetListsUseCase,
          mockSaveShoppingListItemUseCase,
          mockShoppingListServerMappingUseCase,
          mockDeleteShoppingListItemUseCase),
      act: (bloc) => bloc.add(LoadGroceryListItems()),
      expect: () => <RemoteGroceryState>[RemoteGroceryListDone(listToReturn)],
    );
  });
}
