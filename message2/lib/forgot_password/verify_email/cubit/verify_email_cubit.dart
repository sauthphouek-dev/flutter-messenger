import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInit());
}
