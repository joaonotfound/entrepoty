import 'package:mobile_core/mobile_core.dart';


class LocalLoadCurrentAccount implements LoadCurrentAccountUsecase {
  final LoadSecureCacheStorage loadSecureCacheStorage;

  LocalLoadCurrentAccount({
    required this.loadSecureCacheStorage,
  });

  @override
  Future<TokenAccount?> load() async {
    try {
      final token = await loadSecureCacheStorage.loadSecure(key: 'token');
      if (token == null || token.isEmpty) return null;

      return TokenAccount(token: token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
