import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_profile_state.dart';

class ViewProfileCubit extends Cubit<ViewProfileState> {
  ViewProfileCubit() : super(const ViewProfileState());
}
