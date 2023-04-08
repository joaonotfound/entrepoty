import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';

class ImplBackendPresenter implements BackendPresenter {
  LoadCurrentBackendSettings loadCurrentBackendSettings;

  ImplBackendPresenter({
    required this.loadCurrentBackendSettings,
  });

  String getDomain(String domain) {
    if (domain.startsWith("https://") || domain.startsWith("http://")) {
      return domain;
    }
    return "http://${domain}";
  }

  Future<Either<DomainError, String>> loadBaseUrl() async {
    final backendSettings =
    await loadCurrentBackendSettings.loadCurrentBackendSettings();
    return backendSettings.fold(
          (error) => Either.left(DomainError.unexpected),
          (settings) =>
          Either.right("${getDomain(settings.domain)}:${settings.port}"),
    );
  }

  Future<String> getResource(String resource) async {
    final baseUrl = (await loadBaseUrl()).getOrElse((error) => "-1");
    return "$baseUrl${resource}";
  }
}
