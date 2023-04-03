import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/ui.dart';

class GetxCustomerPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxNavigatorManager,
        GetxFormManager
    implements CustomerCreationPresenter {
  Validation validation;
  SaveCustomerUsercase usecase;

  GetxCustomerPresenter({
    required this.validation,
    required this.usecase,
  });

  Future<void> authenticate(BuildContext context) async {
    isLoading = true;
    final response = await usecase.saveCustomer(CustomerEntity(
      id: "",
      name: _name,
      email: _email,
      enrollment: _enrollment,
      sector: _sector,
    ));
    response.fold((error) => mainError = fromDomain(error), (customer) {
      navigateTo = "/home";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Customer created.")),
      );
    });
    isLoading = false;
  }

  void _validateForm() {
    isFormValid = _name != '' &&
        _nameError.value == '' &&
        _email != "" &&
        _emailError.value == "" &&
        _enrollment != "" &&
        _enrollmentError.value == "" &&
        _sector != "" &&
        _sectorError.value == "";
  }

  var _email = "";
  final _emailError = RxString("");
  Stream<String?> get emailErrorStream => _emailError.stream;

  var _enrollment = "";
  final _enrollmentError = RxString("");
  Stream<String?> get enrollmentErrorStream => _enrollmentError.stream;

  var _name = "";
  final _nameError = RxString("");
  Stream<String?> get nameErrorStream => _nameError.stream;

  var _sector = "";
  final _sectorError = RxString("");
  Stream<String?> get sectorErrorStream => _sectorError.stream;

  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: "email", value: email) ?? "";
    _validateForm();
  }

  void validateEnrollment(String enrollment) {
    _enrollment = enrollment;
    _enrollmentError.value =
        validation.validate(field: "enrollment", value: enrollment) ?? "";
    _validateForm();
  }

  void validateName(String name) {
    _name = name;
    _nameError.value = validation.validate(field: "name", value: name) ?? "";
    _validateForm();
  }

  void validateSector(String sector) {
    _sector = sector;
    _sectorError.value =
        validation.validate(field: "sector", value: sector) ?? "";
    _validateForm();
  }
}
