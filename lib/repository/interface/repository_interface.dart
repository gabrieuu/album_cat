import 'package:gatinho_projeto/model/entity/cat.dart';

abstract class IRepository{
  void start();
  Future<List<Cat>> read();
  void write(List<Cat> cats);
}