import '../domain.dart';

abstract class LoadCurrentAccountUsecase {
  Future<TokenAccount?> load();
}
