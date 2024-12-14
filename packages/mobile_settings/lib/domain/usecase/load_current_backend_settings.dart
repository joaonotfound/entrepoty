import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_settings/domain/domain.dart';

abstract class LoadCurrentBackendSettings {
  Future<Either<DomainError, BackendSettings>> loadCurrentBackendSettings();
}
