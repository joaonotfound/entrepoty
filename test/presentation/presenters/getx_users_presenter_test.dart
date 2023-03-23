import 'package:entrepoty/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entrepoty/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockLoadUsers loadUsers;
  late GetxUserListPresenter sut;
  setUp(() {
    loadUsers = MockLoadUsers();
    loadUsers.mockLoadUsers([]);
    sut = GetxUserListPresenter(loadUsersUsecase: loadUsers);
  });
  group("GetxUsersPresenter", () {
    test("should emit users when calling loadUsers", () async {
      sut.usersStream.listen(expectAsync1((users) => expect(users, [])));

      sut.loadUsers();
    });
    test("should emit loading when calling loadUsers", () async {
      expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

      sut.loadUsers();
    });
    test("should emit error when loadUsersUsecase throws", () async {
      loadUsers.mockLoadUsersError(Exception());
      sut.mainErrorStream
          .listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      sut.loadUsers();
    });
  });
}
