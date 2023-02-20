import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_bloc/API/api.dart';

import '../data/model/productModel.dart';

class FetchData{
  API api = API();
  ProductModel? productModel;
  final dio = Dio();
  //List<Map<String, dynamic>> map = [];
  Future<ProductModel?> getProduct()async{
    try {
      Response response = await api.sendRequest.get("?format=json&limit=10&search=rice");
      final ProductModel productModel = ProductModel.fromJson(response.data);
      return productModel;
    }catch(ex){
      throw ex;
    }
  }
}
