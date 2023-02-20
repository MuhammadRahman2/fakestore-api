import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../exception/app_exception.dart';
import '../model/product.dart';

class ApiProduct {
  final baseUrl = 'https://fakestoreapi.com/products';
  List<Product> li = [];

  Future<List<Product>> getProductApi() async {
    // var res;
    try {
      final response = await http.get(Uri.parse(baseUrl));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map i in data) {
          li.add(Product.fromJson(i));
        }
        return li;
      }else {
        throw Exception('error');
      }
    }on SocketException {
      throw FetchDataException('No Internet connection');
    }
     on Error catch (e) {
      print('Error $e');
    }
    return li;
  }
}




  


  // Future<Product> getProductsApi() async {
  //   final response = await http.get(
  //       Uri.parse());
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     return Product.fromJson(data);
  //   } else {
  //     return Product.fromJson(data);
  //   }
  // }





