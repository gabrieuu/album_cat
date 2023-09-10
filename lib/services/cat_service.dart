import 'package:gatinho_projeto/model/entity/cat.dart';
import 'package:gatinho_projeto/services/http/interface/request_http.dart';

const apiKey = "live_oVqmINQs8ytae7pmSYAwPiHwD5w75IJfXSkQ9Qq0gIumN01mkGkfysXY2NYbf5G2";

class CatService{
   IRequestHttp client;

   final url = "https://api.thecatapi.com/v1/images/search?limit=100&api_key=${apiKey}";
   CatService({required this.client});   

   Future<List<Cat>> getCats() async{
    final body = await client.get(url) as List;
    List<Cat> cats = body.map((map) => Cat.fromJson(map)).toList();
    return cats;
   }
}