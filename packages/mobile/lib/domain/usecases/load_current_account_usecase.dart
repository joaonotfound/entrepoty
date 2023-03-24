import 'package:entrepoty/domain/entities/entities.dart';

abstract class LoadCurrentAccountUsecase {
  Future<TokenAccount?> load();
}
