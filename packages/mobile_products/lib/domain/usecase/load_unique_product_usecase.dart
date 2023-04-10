import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_products/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadUniqueProductUsecase {
  Future<Either<DomainError, UniqueProductEntity>> loadUniqueProduct(int id);
}
