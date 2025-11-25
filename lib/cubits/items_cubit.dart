import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/models/load_state.dart';

class ItemsCubit extends Cubit<LoadState<List<String>>> {
  ItemsCubit() : super(LoadState(loading: true));

  Future<void> fetchItems() async {
    emit(LoadState(loading: true));

    try {
      await Future.delayed(Duration(seconds: 3));

      final data = ["Apple", "Banana", "Jackfruits"];

      emit(LoadState(loading: false, data: data));
    } catch (e) {
      emit(LoadState(loading: false, error: "Oops, failed to load"));
    }
  }
}
