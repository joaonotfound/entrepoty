class Employer {
  String username;
  String role;

  Employer({
    required this.username,
    required this.role,
  });

  factory Employer.fromJson(Map json) => Employer(username: json['username'] ?? '', role: json['username'] ?? '');
}
