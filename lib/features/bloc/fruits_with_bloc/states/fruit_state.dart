import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/models/fruit_model.dart';

abstract class FruitState {}

class FruitsInitial extends FruitState {}

class FruitsLoading extends FruitState {}

class FruitsLoaded extends FruitState {
  final List<Fruit> fruits;

  FruitsLoaded({required this.fruits});
}

class FruitsError extends FruitState {
  final String message;

  FruitsError({required this.message});
}
