import 'dart:convert';

import 'package:fic_akatalog_final/data/models/request/product_model.dart';
import 'package:fic_akatalog_final/data/models/response/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductDatasources {
  // future createProduct
  Future<ProductResponseModel> createProduct(ProductModel productModel) async {
    var headers = {'Content-Type': 'application/json'};

    // Map<String, dynamic> requestBody = {
    //   'title': productModel.title,
    //   'price': productModel.price,
    //   'description': productModel.description,
    //   'categoryId': productModel.categoryId,
    //   'images': productModel.images
    // };

    // final body = jsonEncode(productModel.toMap());
    final body = jsonEncode(productModel.toMap());
    print(body);

    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/products'),
      headers: headers,
      // body: productModel.toMap(),
      body: body,
    );

    print('=======');
    print(response.body);

    return ProductResponseModel.fromJson(jsonDecode(response.body));
    // throw UnimplementedError();
  }

  // future update product
  Future<ProductResponseModel> updateProduct(
      ProductModel productModel, int id) async {
    var headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(productModel.toMap());

    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/products/${id}'),
      headers: headers,
      body: body,
    );

    print('=======');
    print(response.body);

    return ProductResponseModel.fromJson(jsonDecode(response.body));
  }

  // Future get product by id
  Future<ProductResponseModel> getProductById(int id) async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products/$id'),
    );
    return ProductResponseModel.fromJson(jsonDecode(response.body));
  }

  //future list get all product
  Future<List<ProductResponseModel>> getAllProduct() async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products'),
    );

    final result = List<ProductResponseModel>.from(jsonDecode(response.body)
        .map((x) => ProductResponseModel.fromJson(x))).toList();

    return result;
  }
}
