import 'package:mobile_core/mobile_core.dart';

import '../../../presentation/presentation.dart';
import '../../main.dart';

GetxCustomerPresenter makeGetxCustomerPresenter() {
  return GetxCustomerPresenter(
    validation: ValidationComposite(validators: [
      RequiredFormFieldValidator(field: "email"),
      EmailFormFieldValidator(field: "email"),
      RequiredFormFieldValidator(field: "name"),
      RequiredFormFieldValidator(field: "enrollment"),
      UserEnrollmentFormFieldValidator(field: "enrollment"),
      RequiredFormFieldValidator(field: "sector"),
    ]),
    usecase: makeRemoteSaveCustomer(),
  );
}
