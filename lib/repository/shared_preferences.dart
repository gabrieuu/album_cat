import 'dart:convert';

import 'package:gatinho_projeto/model/entity/cat.dart';
import 'package:gatinho_projeto/repository/interface/repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

const catskey = "cats_value";

class PreferencesRepository implements IRepository{
  
  late SharedPreferences _prefs;
  
  @override
  void start() async{
    _prefs = await SharedPreferences.getInstance();
    await read();
  }
  
  @override
  Future<List<Cat>> read() async{
    final String jsonString = _prefs.getString(catskey) ?? "[]";
    List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((json) => Cat.fromJson(json)).toList();
  }
  
  @override
  void write(List<Cat> cats){
    final jsonString = json.encode(cats);
    _prefs.setString(catskey, jsonString);
  }


}