import 'package:mobile_core/mobile_core.dart';
import '../domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class LocalSaveCurrentBackendSettings implements SaveCurrentBackendSetings {
  SaveSecureCacheStorage saveSecureCacheStorage;

  LocalSaveCurrentBackendSettings({
    required this.saveSecureCacheStorage,
  });

  @override
  Future<Either<DomainError, BackendSettings>> saveCurrentBackendSettings(
    BackendSettings settings,
  ) async {
    try {
      await saveSecureCacheStorage.saveSecure(key: "backend_domain", value: settings.domain);
      await saveSecureCacheStorage.saveSecure(key: "backend_port", value: settings.port.toString());

      return Either.right(settings);
    } catch (e) {}

    return Either.left(DomainError.unexpected);
  }
}
