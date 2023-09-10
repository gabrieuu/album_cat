import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatinho_projeto/controllers/cat_controller.dart';
import 'package:gatinho_projeto/repository/shared_preferences.dart';
import 'package:gatinho_projeto/services/cat_service.dart';
import 'package:gatinho_projeto/services/http/dio_client.dart';
import 'package:gatinho_projeto/view/mycat_datail.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int axisSizeCount = 3;
  CatController controller = Get.put(CatController(
    service: CatService(client: DioClient()), // passa o dio como parametro de client
    repository: PreferencesRepository(), // passa o Preference como parametro para o repository
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    (axisSizeCount > 7) ? axisSizeCount = 8 : axisSizeCount++;
                  });
                },
                icon: Icon(
                  Icons.zoom_out,
                  size: 30,
                )),
            Text(
              "$axisSizeCount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    (axisSizeCount < 2) ? axisSizeCount = 1 : axisSizeCount--;
                  });
                },
                icon: Icon(
                  Icons.zoom_in,
                  size: 30,
                )),
          ],
        ),
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
        crossAxisCount: axisSizeCount,
      ),
      itemCount: controller.cats.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {},
          onTap: () {
            Get.to(() => MyCatDetails(
                  url: controller.cats[index].url,
                  index: index,
                ));
          },
          child: Card(
            child: Hero(
              tag: "img-$index",
              child: Image.network(
                controller.cats[index].url,
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
