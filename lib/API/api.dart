import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class API{
  Dio _dio = Dio();
  API(){
    _dio.options.baseUrl = "https://panel.supplyline.network/api/product/search-suggestions/?format=json&limit=10&search=rice";
    _dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendRequest => _dio;
}