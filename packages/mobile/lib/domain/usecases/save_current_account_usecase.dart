import 'package:mobile_core/domain/domain.dart';

abstract class SaveCurrentAccountUsecase {
  Future<void> saveAccount({
    required Account account,
  });
}
