import 'dart:io';
import 'package:go_router/go_router.dart';
import "package:dio/dio.dart";
import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/providers/pets_provider.dart';

Future<List<Pet>> getpets() async {
  Dio client = Dio();
  List<Pet> pets = [];
  try {
    Response response =
        await client.get("https://coded-pets-api-crud.herokuapp.com/pets");
    pets = (response.data as List).map((pet) => Pet.fromJson(pet)).toList();
  } on DioError catch (error) {
    print("Check Connection $error");
  }
  return pets;
}
