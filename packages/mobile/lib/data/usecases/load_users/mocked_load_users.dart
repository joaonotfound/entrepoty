import 'package:entrepoty/domain/domain.dart';

class MockedLoadUsers extends LoadUsersUsecase {
  final _users = List.generate(
    3,
    (index) => UserEntity(
      id: "id-$index",
      name: "user $index",
      email: "mocked@gmail.com",
      permissionLevel: PermissionLevel.Employeer,
    ),
  );
  @override
  Future<List<UserEntity>> loadUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return _users;
  }
}
