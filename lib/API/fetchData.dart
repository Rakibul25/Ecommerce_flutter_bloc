import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ecommerce_flutter_bloc/API/api.dart';
import 'package:ecommerce_flutter_bloc/data/model/individuakProductModel.dart';

import '../data/model/productModel.dart';

class FetchData{
  API api = API();
  //this function to fetch for initial search page
  Future<ProductModel> getProduct(String name)async{
    try {
      Response response = await api.sendRequest.get("https://panel.supplyline.network/api/product/search-suggestions/?format=json&limit=10&search=$name");
      var data = response.data;
      return ProductModel.fromJson(data);
    }catch(ex){
      throw ("Nothing Similar to $name");
    }
  }
  //this funtion to fetch if next link available
  Future<ProductModel> nextProduct(String querytonext)async{
    try {
      Response response = await api.sendRequest.get(querytonext);
      var data = response.data;
      return ProductModel.fromJson(data);
    }catch(ex){
      throw ("Nothing Similar to $querytonext");
    }
  }
  //this function to fetch data if previous link available
  Future<ProductModel> prevProduct(String querytoprev)async{
    try {
      Response response = await api.sendRequest.get(querytoprev);
      var data = response.data;
      return ProductModel.fromJson(data);
    }catch(ex){
      throw ("Nothing Similar to $querytoprev");
    }
  }
  Future<IndividualProduct> singleproduct(String slug)async{
    try {
      Response response = await api.sendRequest.get("https://panel.supplyline.network/api/product-details/$slug/");
      var data = response.data;
      return IndividualProduct.fromJson(data);
    }catch(ex){
      throw ex;
    }
  }
}
