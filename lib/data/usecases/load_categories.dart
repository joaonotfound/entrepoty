import 'package:service_desk_2/domain/domain.dart';
import '../http/http.dart';

abstract class RequestResponse {
  List<CategoryEntity> get categories;
}

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
      if (response.body?.categories == null) return [];

      return response.body?.categories.map(
        (category) => CategoryEntity(
          name: category["name"],
          models: category["models"].map(
            (model) => StockItemModelEntity(name: model.name),
          ) as List<StockItemModelEntity>,
        ),
      );
    } on HttpError catch (_) {
      return [];
    }
  }
}
