import 'package:flutter/material.dart';
import 'package:service_desk_2/domain/domain.dart';

abstract class UsersScreenPresenter implements Listenable {
  Stream<List<UserEntity>?> get usersStream;
  Future<void> loadUsers();
}
