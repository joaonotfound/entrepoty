import '../domain.dart';

abstract class SaveCurrentAccountUsecase {
  Future<void> saveAccount({
    required Account account,
  });
}
