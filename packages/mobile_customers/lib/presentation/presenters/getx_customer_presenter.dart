import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
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

  @override
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
      Get.back();
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
  @override
  Stream<String?> get emailErrorStream => _emailError.stream;

  var _enrollment = "";
  final _enrollmentError = RxString("");
  @override
  Stream<String?> get enrollmentErrorStream => _enrollmentError.stream;

  var _name = "";
  final _nameError = RxString("");
  @override
  Stream<String?> get nameErrorStream => _nameError.stream;

  var _sector = "";
  final _sectorError = RxString("");
  @override
  Stream<String?> get sectorErrorStream => _sectorError.stream;

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = validation.validate(field: "email", value: email) ?? "";
    _validateForm();
  }

  @override
  void validateEnrollment(String enrollment) {
    _enrollment = enrollment;
    _enrollmentError.value =
        validation.validate(field: "enrollment", value: enrollment) ?? "";
    _validateForm();
  }

  @override
  void validateName(String name) {
    _name = name;
    _nameError.value = validation.validate(field: "name", value: name) ?? "";
    _validateForm();
  }

  @override
  void validateSector(String sector) {
    _sector = sector;
    _sectorError.value =
        validation.validate(field: "sector", value: sector) ?? "";
    _validateForm();
  }
}
