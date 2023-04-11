import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class DeleteProductModelUsecase {
  Future<Either<DomainError, ProductModelEntity>> deleteModel(int id);
}
