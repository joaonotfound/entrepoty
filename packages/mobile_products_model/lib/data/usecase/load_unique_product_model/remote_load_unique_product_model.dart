import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../domain/domain.dart';

class RemoteLoadUniqueProductModel implements LoadUniqueProductModelUsecase {
  HttpClient client;
  String url;

  RemoteLoadUniqueProductModel({
    required this.client,
    required this.url,
  });

  @override
  Future<Either<DomainError, ProductModelAndDetails>> loadModelById(int id) async {
    try {
      print(url);
      final response = await client.get(url: "$url/$id");
      if(response.statuscode == 200){
        print(response.body);
        return Either.right(ProductModelAndDetails.fromJson(response.body));
      }
    }catch(e){
      print("error " + e.toString());
    }

    return Either.left(DomainError.unexpected);
  }
}
