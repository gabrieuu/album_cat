import 'package:gatinho_projeto/model/entity/cat.dart';
import 'package:gatinho_projeto/repository/interface/repository_interface.dart';
import 'package:gatinho_projeto/repository/shared_preferences.dart';
import 'package:gatinho_projeto/services/cat_service.dart';
import 'package:get/get.dart';

class CatController extends GetxController{

  List<Cat> _cats = <Cat>[].obs;
  
  IRepository repository;

  final CatService service;

  final RxBool _isLoading = false.obs; 

  CatController({required this.service, required this.repository});

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    _isLoading.value = true;
    repository.start();
    if(_cats.isEmpty){
      await fetchAll();
      await fetchPreferences();
    }
    _isLoading.value = false;
  }

  Future<void> fetchAll() async {   
    final catList = await service.getCats();
    repository.write(catList);   
  }

  Future<void> fetchPreferences() async{
   
    _cats = await repository.read();
   
  }

  List<Cat> get cats => _cats;

  RxBool get isLoading => _isLoading;
}