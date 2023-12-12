import 'dart:async';
import 'package:dio/dio.dart';
import 'package:learn_dio/service/model.dart';
import 'core.dart';

abstract class DioNetwork{
  FutureOr<List<Products>>getMethod({String baseUrl = Api.baseUrl,String api = Api.apiProduct});
  // Future<String?>getSingleMethod({String baseUrl = Api.baseUrl,String api = Api.apiProduct});
  // Future<String?>getOderProductMethod({String baseUrl = Api.baseUrl,String api = Api.apiProduct});
  // Future<String?>getCategory({String baseUrl = Api.baseUrl,String api = Api.apiCategory});
  // Future<String?>getUserCart({String baseUrl = Api.baseUrl,String api = Api.apiAddCart});
  // Future<String?>getUser({String baseUrl = Api.baseUrl,String api = Api.apiUser});
  // Future<String?>postMethod({String baseUrl = Api.baseUrl,String api = Api.apiAddCart,required Map<String,Object> data});
  // Future<String?>postProducts({String baseUrl = Api.baseUrl,String api = Api.apiProduct,required Map<String,Object> data});
}

class DioNetworkImpl extends DioNetwork with DioMixin{
  @override
  FutureOr<List<Products>> getMethod({String baseUrl = Api.baseUrl, String api = Api.apiProduct,})async{
     Dio dio = Dio();
     final response = await dio.get("$baseUrl$api");
     try{
       if(response.statusCode == 200 || response.statusCode == 201){
         return (response.data as List).map<Products>((e) => Products.fromJson(e as Map<String,Object?>)).toList();
       }
     }catch(e){
       throw Exception("GetMethod Error: => $e");
     }
     return [];
  }
}
