class CustomerEntity {
  final String id;
  final String name;
  final String email;
  final String enrollment;
  final String sector;

  const CustomerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.enrollment,
    required this.sector,
  });

  factory CustomerEntity.fromJson(Map<String, String> json) => CustomerEntity(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        enrollment: json["enrollment"] ?? "",
        sector: json["sector"] ?? "",
      );
}
