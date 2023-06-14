import 'package:dio/dio.dart';

import 'end_point.dart';

class DataHelper{
  static Dio dio=Dio();

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      )
    );

  }
  
 static Future<Response> getData({
    required String url,
    Map<String,dynamic>?queryParameters})async{
    try {
      Response response = await dio.get(url, queryParameters: queryParameters
      );
      return response;
    }on DioError catch(e){
         print(e);
         rethrow;
    }
  }
}



