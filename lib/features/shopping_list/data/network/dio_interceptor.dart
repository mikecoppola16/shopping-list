import 'package:dio/dio.dart';
import 'package:shopping_list_app/core/constants/constants.dart';

class DioInterceptor extends Interceptor {

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Here you can put the token, either from preference, sqlite, etc.
    // Here is an example with Preferences
    //final someToken? = prefs.getString('token');
    // After you choose your token, you assign it to the request.


  /*

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: headers,
    );   */
    
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON
    }; 

    options.headers = headers;
    
    
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    //response.data ??= Map<dynamic,dynamic>;

    response.data ??= "";

    super.onResponse(response, handler);
  }

  @override
  Future onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // If the error is 401 Unauthorized, log out the user
    /* if (err.response?.statusCode == 401) {
      _repository.logOut();
      _appDatabase.userDao.deleteAllUsers();
    } */
    super.onError(err, handler);
  }
}