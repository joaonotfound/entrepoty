import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class TakeImageUsecase {
  Future<Either<DomainError, String>> takeImage();
}