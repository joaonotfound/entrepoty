import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class CreateProductUsecas {
  Future<Either<DomainError, ProductEntity>> createProduct({
    required int model,
    required int quantity,
    required String receiptPath,
  });
}
