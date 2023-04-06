import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';

ModelViewScreen makeModelViewScreen() {
  return ModelViewScreen(
    presenter: GetxModelViewPresenter(
      loadUniqueProductModel: makeRemoteLoadUniqueProductModel(),
      remoteDeleteProductModel: makeRemoteDeleteProductModel(),
    ),
  );
}
