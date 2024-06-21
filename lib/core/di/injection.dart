import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list_app/config/routes/app_router.dart';
import 'package:shopping_list_app/features/shopping_list/data/data_sources/remote/shopping_list_api_service.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/dio_interceptor.dart';
import 'package:shopping_list_app/features/shopping_list/data/repository/grocery_item_repository_implementation.dart';
import 'package:shopping_list_app/features/shopping_list/domain/repository_contracts/grocery_item_repository.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/delete_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/get_shopping_list_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/save_shopping_item_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/domain/usecases/shopping_list_server_mapping_usecase.dart';
import 'package:shopping_list_app/features/shopping_list/presentation/bloc/article/remote/remote_grocery_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  Dio dio = Dio();
  dio.interceptors.add(DioInterceptor());

  getIt.registerSingleton<Dio>(dio);

  //dependencies
  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerSingleton<ShoppingListApiService>(
      ShoppingListApiService(getIt()));

  getIt.registerSingleton<GroceryItemRepository>(
      GroceryItemRepositoryImpl(getIt()));

  //use cases
  getIt.registerSingleton<GetShoppingListUseCase>(
      GetShoppingListUseCase(getIt()));

  getIt.registerSingleton<SaveShoppingListItemUseCase>(
      SaveShoppingListItemUseCase(getIt()));

  getIt.registerSingleton<DeleteShoppingListItemUseCase>(
      DeleteShoppingListItemUseCase(getIt()));

  getIt.registerSingleton<ShoppingListServerMappingUseCase>(
      ShoppingListServerMappingUseCase());

  //blocs
  getIt.registerSingleton<RemoteGroceryItemsBloc>(
      RemoteGroceryItemsBloc(getIt(), getIt(), getIt(), getIt()));
}
