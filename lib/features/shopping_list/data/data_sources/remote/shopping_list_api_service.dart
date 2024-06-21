import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopping_list_app/core/constants/constants.dart';
import 'package:shopping_list_app/features/shopping_list/data/models/grocery_item_model.dart';

part 'shopping_list_api_service.g.dart';

@RestApi(baseUrl: shoppingListAPIBaseUrl)
abstract class ShoppingListApiService {
  factory ShoppingListApiService(Dio dio, {String baseUrl}) =
      _ShoppingListApiService;

  @GET('/shopping-list/items.json')
  Future<HttpResponse<Map<String, GroceryItemModel>>> getShoppingListItems();

  @POST('/shopping-list/items.json')
  Future<HttpResponse<Map<String, String>>> saveShoppingListItem(
    @Body() GroceryItemModel groceryItemModel,
  );

  @DELETE('/shopping-list/items/{key}.json')
  Future<HttpResponse<String>> deleteShoppingListItem(
    @Path() String key,
  );
}
