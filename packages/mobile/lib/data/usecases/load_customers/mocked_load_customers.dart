import 'package:entrepoty/domain/domain.dart';

class MockedLoadCustomers extends LoadCustomersUsecase {
  final _users = List.generate(
    3,
    (index) => CustomerEntity(
      id: "id-$index",
      name: "user $index",
      email: "mocked@gmail.com",
      enrollment: "random-number",
      sector: "Human Resources",
    ),
  );
  @override
  Future<List<CustomerEntity>> loadCustomers() async {
    await Future.delayed(Duration(seconds: 2));
    return _users;
  }
}
