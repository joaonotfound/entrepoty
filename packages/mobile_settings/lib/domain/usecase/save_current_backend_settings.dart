import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_settings/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

abstract class SaveCurrentBackendSetings {
  Future<Either<DomainError, BackendSettings>> saveCurrentBackendSettings(
    BackendSettings settings,
  );
}
