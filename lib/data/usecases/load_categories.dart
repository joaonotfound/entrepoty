import 'package:service_desk_2/domain/domain.dart';
import '../http/http.dart';

class LoadCategories implements LoadCategoriesUsecase {
  final String url;
  final HttpClient httpClient;
  const LoadCategories({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<List<CategoryEntity>> load() async {
    try {
      var response = await httpClient.get(url: url);
      if (response.body?["categories"] == null) return [];

      List<CategoryEntity> categories =
          (response.body?["categories"].cast() as List)
              .map((category) => CategoryEntity.fromJson(category))
              .toList();

      return categories;
    } on HttpError catch (_) {
      return [];
    }
  }
}
