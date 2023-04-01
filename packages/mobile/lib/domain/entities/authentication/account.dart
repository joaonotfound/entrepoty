class Account {
  final String name;
  final String username;
  final String profilePictureUrl;
  final String token;
  const Account({
    required this.token,
    required this.username,
    required this.name,
    required this.profilePictureUrl,
  });
}
