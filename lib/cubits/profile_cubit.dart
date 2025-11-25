import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_mastery/models/profile_model.dart';

class ProfileCubit extends Cubit<ProfileModel> {
  ProfileCubit() : super(ProfileModel(name: "Asib", age: 5));

  void setName({required String name}) =>
      emit(ProfileModel(name: name, age: state.age));

  void haveBirthday() =>
      emit(ProfileModel(name: state.name, age: state.age + 1));
}
