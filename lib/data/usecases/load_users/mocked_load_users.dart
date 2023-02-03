import 'package:service_desk_2/domain/domain.dart';

class MockedLoadUsers extends LoadUsersUsecase {
  final _users = List.generate(
      30,
      (index) => UserEntity(
          name: "user $index",
          profilePicture: "https://source.boringavatars.com/beam"));
  @override
  Future<List<UserEntity>> loadUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return _users;
  }
}
