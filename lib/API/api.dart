import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class API{
  Dio _dio = Dio();
  API(){
    _dio.options.baseUrl = "";
    //keeping this empty, cause this class is using for multiple link
    //_dio.interceptors.add(PrettyDioLogger());
  }
  Dio get sendRequest => _dio;
}