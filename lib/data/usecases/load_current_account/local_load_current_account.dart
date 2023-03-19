import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccountUsecase {
  final LoadSecureCacheStorage loadSecureCacheStorage;

  LocalLoadCurrentAccount({
    required this.loadSecureCacheStorage,
  });

  @override
  Future<TokenAccount?> load() async {
    try {
      var token = await loadSecureCacheStorage.loadSecure(key: "token");
      if (token == null) return null;
      return TokenAccount(token: token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
