import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/models/fruit_model.dart';

class FruitRepository {
  Future<List<Fruit>> fetchFruits() async {
    await Future.delayed(Duration(seconds: 3));

    return [
      Fruit(name: "Apple", color: "Red"),
      Fruit(name: "Banana", color: "Yellow"),
      Fruit(name: "Grapes", color: "Purple"),
      Fruit(name: "Orange", color: "Orange"),
    ];
  }
}
