import 'package:service_desk_2/data/data.dart';
import 'package:service_desk_2/domain/domain.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccountUsecase {
  final LoadSecureCacheStorage loadSecureCacheStorage;

  LocalLoadCurrentAccount({
    required this.loadSecureCacheStorage,
  });

  @override
  Future<Account?> load() async {
    var token = await loadSecureCacheStorage.loadSecure(key: "token");
  }
}
