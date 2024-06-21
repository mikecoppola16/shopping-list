import 'package:either_dart/either.dart';
import 'package:shopping_list_app/features/shopping_list/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}