import 'dart:convert';
import 'package:practica_4/models/Product.dart';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) => json.encode(data.toJson());

class ProductsResponse {
  ProductsResponse({
    required this.status,
    required this.products,
  });

  final bool status;
  final List<Product> products;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
    status: json["status"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}