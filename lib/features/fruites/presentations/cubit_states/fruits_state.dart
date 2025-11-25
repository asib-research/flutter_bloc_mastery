class FruitsState {
  final bool loading;
  final List<String> fruits;
  final String? error;
  FruitsState({this.loading = false, List<String>? fruits, this.error})
      : fruits = fruits ?? [];
}