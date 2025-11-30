import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/events/multi_bloc_profile_event.dart';
import 'package:flutter_bloc_mastery/multi_bloc_system/states/multi_block_profile_state.dart';

class MultiBlocProfile
    extends Bloc<MultiBlocProfileEvent, MultiBlocProfileState> {
  MultiBlocProfile() : super(MultiBlocProfileInitial()) {
    on<MultiBlocFetchProfileEvent>((event, emit) async {
      emit(MultiBlocProfileLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(MultiBlocProfileLoaded(name: "Asib", email: "asib@gmail.com"));
    });
  }
}
