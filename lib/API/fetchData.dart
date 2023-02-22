import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_bloc/API/api.dart';

import '../data/model/productModel.dart';

class FetchData{
  API api = API();
  Future<ProductModel> getProduct()async{
    try {
      Response response = await api.sendRequest.get("&limit=10&search=rice");
      var data = response.data;
      return ProductModel.fromJson(data);
      //print(response.data);
      //return resultsList;
    }catch(ex){
      throw ex;
    }
  }
}
