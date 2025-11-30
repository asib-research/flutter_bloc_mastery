import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/events/fruit_event.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/repositories/fruit_repository.dart';
import 'package:flutter_bloc_mastery/features/bloc/fruits_with_bloc/states/fruit_state.dart';

class FruitBloc extends Bloc<FruitEvent, FruitState> {
  final FruitRepository fruitsRepository;

  FruitBloc(this.fruitsRepository) : super(FruitsInitial()) {
    on<FetchFruitsEvent>((event, emit) async {
      emit(FruitsLoading());
      try {
        final fruits = await fruitsRepository.fetchFruits();
        emit(FruitsLoaded(fruits: fruits));
      } catch (e) {
        emit(FruitsError(message: "Failed to fetch fruits"));
      }
    });
  }
}
