import '../../../ui/ui.dart';
import '../../../presentation/presentation.dart';
import '../../../main/main.dart';

ModelViewScreen makeModelViewScreen() {
  return ModelViewScreen(
    presenter: GetxModelViewPresenter(
      loadUniqueProductModel: makeRemoteLoadUniqueProductModel(),
      remoteDeleteProductModel: makeRemoteDeleteProductModel(),
    ),
  );
}
