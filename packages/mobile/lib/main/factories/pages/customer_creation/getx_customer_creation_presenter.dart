import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/validation/validation.dart';

GetxCustomerPresenter makeGetxCustomerPresenter() {
  return GetxCustomerPresenter(
    validation: ValidationComposite(validators: [
      RequiredFieldValidator(field: "email"),
      RequiredFieldValidator(field: "name"),
      RequiredFieldValidator(field: "enrollment"),
      RequiredFieldValidator(field: "sector"),
    ]),
    usecase: makeRemoteSaveCustomer(),
  );
}
