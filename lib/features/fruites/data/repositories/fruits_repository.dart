class FruitsRepository {
  Future<List<String>> getFruits() async {
    await Future.delayed(Duration(seconds: 3));
    return ["Apple", "Banana", "Mango"];
  }
}
