import 'package:dio/dio.dart';
import 'package:gatinho_projeto/services/http/interface/request_http.dart';

class DioClient implements IRequestHttp{

  Dio dio = Dio();

  @override
  Future get(String url) async{
    final response = await dio.get(url);
    return response.data;
  }

}