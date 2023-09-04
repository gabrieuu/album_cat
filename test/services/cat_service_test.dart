
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gatinho_projeto/model/entity/cat.dart';
import 'package:gatinho_projeto/services/cat_service.dart';
import 'package:gatinho_projeto/services/http/dio_client.dart';
import 'package:gatinho_projeto/services/http/interface/request_http.dart';
import 'package:mockito/mockito.dart';


void main(){
  test("deve fazer a requisição", () async {
    final catService = CatService(client: DioClient());


    final List<Cat> cats = await catService.getCats();

    cats.map((e) => print(e.id));
  });
}

const json = r"""
[
  {
    "id": "dn",
    "url": "https://cdn2.thecatapi.com/images/dn.jpg",
    "width": 385,
    "height": 576
  },
  {
    "id": "9v7",
    "url": "https://cdn2.thecatapi.com/images/9v7.jpg",
    "width": 500,
    "height": 337
  },
  {
    "id": "aqv",
    "url": "https://cdn2.thecatapi.com/images/aqv.jpg",
    "width": 500,
    "height": 335
  },
  {
    "id": "bi4",
    "url": "https://cdn2.thecatapi.com/images/bi4.png",
    "width": 500,
    "height": 335
  },
  {
    "id": "c1i",
    "url": "https://cdn2.thecatapi.com/images/c1i.jpg",
    "width": 600,
    "height": 600
  },
  {
    "id": "cdr",
    "url": "https://cdn2.thecatapi.com/images/cdr.png",
    "width": 400,
    "height": 600
  },
  {
    "id": "cki",
    "url": "https://cdn2.thecatapi.com/images/cki.jpg",
    "width": 500,
    "height": 374
  },
  {
    "id": "eap",
    "url": "https://cdn2.thecatapi.com/images/eap.jpg",
    "width": 961,
    "height": 688
  },
  {
    "id": "MTU3OTc2NQ",
    "url": "https://cdn2.thecatapi.com/images/MTU3OTc2NQ.jpg",
    "width": 960,
    "height": 1280
  },
  {
    "id": "_I3nlhPtP",
    "url": "https://cdn2.thecatapi.com/images/_I3nlhPtP.jpg",
    "width": 275,
    "height": 183
  }
]
""";