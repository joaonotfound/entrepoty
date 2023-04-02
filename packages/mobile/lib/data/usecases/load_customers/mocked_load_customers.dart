import 'package:entrepoty/domain/domain.dart';

class MockedLoadCustomers extends LoadCustomersUsecase {
  final _users = List.generate(
    3,
    (index) => CustomerEntity(
      id: "id-$index",
      name: "user $index",
      email: "mocked@gmail.com",
      permissionLevel: PermissionLevel.Employeer,
    ),
  );
  @override
  Future<List<CustomerEntity>> loadCustomers() async {
    await Future.delayed(Duration(seconds: 2));
    return _users;
  }
}
