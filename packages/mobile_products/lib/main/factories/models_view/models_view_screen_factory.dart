import '../../../main/main.dart';
import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';

ModelViewScreen makeModelViewScreen() {
  return ModelViewScreen(
    presenter: GetxModelViewPresenter(
      remoteCreateEquities: makeRemoteCreateEquities(),
      loadUniqueProductModel: makeRemoteLoadUniqueProductModel(),
      remoteDeleteProductModel: makeRemoteDeleteProductModel(),
    ),
  );
}
