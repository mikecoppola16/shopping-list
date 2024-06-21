import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/error_handler.dart';

class BaseRepository {
  
  Failure nullCheckFailure(int? statusCode, String? statusMessage) {
    return Failure(statusCode ?? ApiInternalStatus.FAILURE,
        statusMessage ?? ResponseMessage.DEFAULT);
  }
}
