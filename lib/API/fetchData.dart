import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_bloc/API/api.dart';

import '../data/model/productModel.dart';

class FetchData{
  API api = API();
  Future<List<Result>> getProduct()async{
    try {
      Response response = await api.sendRequest.get("&limit=10&search=rice");
      Map<String, dynamic> data = response.data['data'];
      List<dynamic> results = data['products']['results'];
      List<Result> resultsList = results.map((json) => Result.fromJson(json)).toList();
      return resultsList;
    }catch(ex){
      throw ex;
    }
  }
}
