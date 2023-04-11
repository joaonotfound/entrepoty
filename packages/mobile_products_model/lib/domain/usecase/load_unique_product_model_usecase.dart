import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class LoadUniqueProductModelUsecase {
  Future<Either<DomainError, UniqueProductEntity>> loadModelById(int id);
}
