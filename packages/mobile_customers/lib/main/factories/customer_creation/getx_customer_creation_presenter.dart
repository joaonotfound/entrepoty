import 'package:mobile_core/mobile_core.dart';

import '../../../presentation/presentation.dart';
import '../../main.dart';

GetxCustomerPresenter makeGetxCustomerPresenter() {
  return GetxCustomerPresenter(
    validation: ValidationComposite(validators: [
      const RequiredFormFieldValidator(field: "email"),
      EmailFormFieldValidator(field: "email"),
      const RequiredFormFieldValidator(field: "name"),
      const RequiredFormFieldValidator(field: "enrollment"),
      UserEnrollmentFormFieldValidator(field: "enrollment"),
      const RequiredFormFieldValidator(field: "sector"),
    ]),
    usecase: makeRemoteSaveCustomer(),
  );
}
