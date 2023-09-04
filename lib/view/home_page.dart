import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatinho_projeto/controllers/cat_controller.dart';
import 'package:gatinho_projeto/services/cat_service.dart';
import 'package:gatinho_projeto/services/http/dio_client.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CatController controller =
      Get.put(CatController(service: CatService(client: DioClient())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cats"),
      ),
      body: Obx(() => controller.isLoading.value ? _load() : _body()),
    );
  }

  _load() {
    return Center(child: CircularProgressIndicator());
  }

  _body() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: controller.cats.length,
      itemBuilder: (context, index) {
        return GridTile(
          
          child: new InkResponse(
            child: Image.network(controller.cats[index].url),
            onTap: (){},
          ),
        );
      },
    );
  }
}
