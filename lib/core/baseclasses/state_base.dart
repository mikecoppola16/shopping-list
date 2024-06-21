import 'package:equatable/equatable.dart';
import 'package:shopping_list_app/assets/strings.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';

abstract class BaseState extends Equatable {
  final Failure? error;
  const BaseState({required this.error});

  String getSafeErrorMsg(bool retry) {
    if (error?.message == null) {
      return retry ? "${AString.errorNoDetails} ${AString.tapRetry}" : AString.errorNoDetails;
    }
    return ( "${AString.errorDetails} ${error?.message}" );
  }
}