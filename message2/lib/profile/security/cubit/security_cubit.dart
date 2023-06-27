import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'security_state.dart';

class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit() : super(const SecurityState());
}
