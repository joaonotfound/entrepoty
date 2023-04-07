import 'package:mobile_core/mobile_core.dart';

import '../../../presentation/presentation.dart';
import '../../main.dart';

GetxCustomerPresenter makeGetxCustomerPresenter() {
  return GetxCustomerPresenter(
    validation: ValidationComposite(validators: [
      RequiredFieldValidator(field: "email"),
      EmailFieldValidator(field: "email"),
      RequiredFieldValidator(field: "name"),
      RequiredFieldValidator(field: "enrollment"),
      UserEnrollmentFieldValidator(field: "enrollment"),
      RequiredFieldValidator(field: "sector"),
    ]),
    usecase: makeRemoteSaveCustomer(),
  );
}
