import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/domain/domain.dart';

abstract class UserListPresenter implements Listenable {
  Stream<List<UserEntity>?> get usersStream;
  Stream<bool> get isLoadingStream;
  Stream<UiError?> get mainErrorStream;
  Future<void> loadUsers();
}
