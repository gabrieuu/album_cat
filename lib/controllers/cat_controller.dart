import 'package:gatinho_projeto/model/entity/cat.dart';
import 'package:gatinho_projeto/services/cat_service.dart';
import 'package:get/get.dart';

class CatController extends GetxController{

  List<Cat> _cats = <Cat>[].obs;
  
  final CatService service;

  final RxBool _isLoading = false.obs; 

  CatController({required this.service});

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await fetchAll();
  }

  Future<void> fetchAll() async {
    _isLoading.value = true;
    _cats = await service.getCats();
    _isLoading.value = false;
  }

  List<Cat> get cats => _cats;

  RxBool get isLoading => _isLoading;
}