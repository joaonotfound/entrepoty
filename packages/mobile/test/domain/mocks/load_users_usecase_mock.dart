import 'package:mocktail/mocktail.dart';
import 'package:entrepoty/domain/domain.dart';

class MockLoadUsers extends Mock implements LoadUsersUsecase {
  When _mockLoadUsersCall() => when(
        () => loadUsers(),
      );
  void mockLoadUsers(List<UserEntity> data) =>
      _mockLoadUsersCall().thenAnswer((invocation) async => data);
  void mockLoadUsersError(dynamic error) =>
      _mockLoadUsersCall().thenThrow(error);
}
