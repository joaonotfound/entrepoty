import '../domain.dart';

class CreateProductResponse {
  List<ProductDetailEntity> details;

  CreateProductResponse({
    required this.details,
  });

  factory CreateProductResponse.fromJson(Map json) {
    final List<dynamic> details = json['details'];
    return CreateProductResponse(
      details: details
          .map(
            (detail) => ProductDetailEntity.fromJson(detail),
          )
          .toList() as List<ProductDetailEntity>,
    );
  }
}
