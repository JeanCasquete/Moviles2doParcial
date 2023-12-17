import 'package:practica_4/helpers/base_dio.dart';
import 'package:practica_4/helpers/http_response.dart';
import 'package:practica_4/models/products_response.dart';

class ProductApi {
  final BaseDio baseDio;
  ProductApi(this.baseDio);

  Future<HttpResponse<ProductsResponse>> getProducts() async {
    return baseDio.resquest('/https://fakestoreapi.com/products',
        method: 'GET', headers: {}, parser: (data) {
      return ProductsResponse.fromJson(data);
    });
  }
}
