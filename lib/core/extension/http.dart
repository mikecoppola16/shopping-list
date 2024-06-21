import 'package:retrofit/retrofit.dart';

extension HttpExceptionExt on HttpResponse {
  int? statusCode() {
    return response.statusCode;
  }

  String? statusMessage() {
    return response.statusMessage;
  }
}
