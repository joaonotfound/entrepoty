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

  factory Account.fromJson(Map json) => Account(
        token: json["token"] ?? "",
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        profilePictureUrl: json["profile_url"] ?? "",
      );
}
