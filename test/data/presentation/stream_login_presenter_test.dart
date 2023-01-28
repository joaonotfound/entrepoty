import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presenters/stream_login_presenter.dart';
import 'package:service_desk_2/ui/screens/screens.dart';
import 'package:service_desk_2/validation/validator.dart';

import '../mocks/validation_mock.dart';

void main() {
  late LoginPresenter loginPresenter;
  late MockValidation validator;
  String id = faker.guid.guid();
  setUp(() {
    validator = MockValidation();
    validator.mockValidate("response");
    loginPresenter = StreamLoginPresenter(validator: validator);
  });
  test("should call validate with correct values", () {
    loginPresenter.validateId(id);
    verify(() => validator.validate(field: "id", value: id)).called(1);
  });
}
