import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_editing_state.dart';

class ProfileEditingCubit extends Cubit<ProfileEditingState> {
  ProfileEditingCubit() : super(const ProfileEditingState());
}
