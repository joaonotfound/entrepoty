import 'package:service_desk_2/domain/entities/authentication/authentication.dart';

abstract class SplashPresenter {
  Stream<String?> get navigateToStream;
  Future<void> checkAccount();
}
