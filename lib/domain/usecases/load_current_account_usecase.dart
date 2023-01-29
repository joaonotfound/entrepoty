import 'package:service_desk_2/domain/entities/entities.dart';

abstract class LoadCurrentAccountUsecase {
  Future<TokenAccount?> load();
}
