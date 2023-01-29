import 'package:service_desk_2/domain/domain.dart';

abstract class SaveCurrentAccountUsecase {
  Future<void> saveAccount({
    required Account account,
  });
  Future<Account?> loadCurrentAccount();
}
