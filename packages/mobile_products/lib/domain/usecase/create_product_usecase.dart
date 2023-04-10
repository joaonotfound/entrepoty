import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products/domain/dto/create_product_response.dart';

import '../domain.dart';

abstract class CreateProductUsecas {
  Future<Either<DomainError, CreateProductResponse>> createProduct({
    required int model,
    required int quantity,
    required String receiptPath,
  });
}
