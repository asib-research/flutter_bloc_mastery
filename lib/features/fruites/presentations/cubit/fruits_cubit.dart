import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/features/fruites/data/repositories/fruits_repository.dart';
import 'package:flutter_bloc_mastery/features/fruites/presentations/cubit_states/fruits_state.dart';

class FruitsCubit extends Cubit<FruitsState> {
  final FruitsRepository repository;

  FruitsCubit(this.repository) : super(FruitsState());

  Future<void> loadFruits() async {
    emit(FruitsState(loading: true));
    try {
      final data = await repository.getFruits();

      emit(FruitsState(loading: false, fruits: data));
    } catch (e) {
      emit(FruitsState(loading: false, error: 'Failed to load fruits'));
    }
  }
}
