import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/domain/domain.dart';

class LocalLoadCurrentBackendSettings implements LoadCurrentBackendSettings {
  LoadSecureCacheStorage loadSecureCacheStorage;

  LocalLoadCurrentBackendSettings({
    required this.loadSecureCacheStorage,
  });

  @override
  Future<Either<DomainError, BackendSettings>>
      loadCurrentBackendSettings() async {
    try {
      final String domain =
          await loadSecureCacheStorage.loadSecure(key: 'backend_domain') ??
              '10.0.2.2';
      final int port = int.parse(
          await loadSecureCacheStorage.loadSecure(key: 'backend_port') ??
              '8080',);

      return Either.right(
        BackendSettings(
          domain: domain,
          port: port,
        ),
      );
    } catch (e) {}
    return Either.left(DomainError.unexpected);
  }
}
