import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalSaveCurrentAccount extends Mock
    implements LocalSaveCurrentAccount {
  When _mockSaveCall() =>
      when(() => saveAccount(account: any(named: "account")));
  void mockSave(dynamic data) =>
      _mockSaveCall().thenAnswer((invocation) async => data);
  void mockSaveError(dynamic error) => _mockSaveCall().thenThrow(error);
}
