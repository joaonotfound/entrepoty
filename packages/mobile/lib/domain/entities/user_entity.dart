enum PermissionLevel {
  Administrator,
  Employeer,
}

class UserEntity {
  final String id;
  final String name;
  final String email;
  final PermissionLevel permissionLevel;
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.permissionLevel,
  });
}
