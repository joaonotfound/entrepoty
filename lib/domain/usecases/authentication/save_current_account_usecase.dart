import '../../../domain/domain.dart';

abstract class SaveCurrentAccountUsecase {
  Future<void> saveAccount({
    required Account account,
  });
}
