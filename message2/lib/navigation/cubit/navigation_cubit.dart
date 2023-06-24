import 'package:bloc/bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.home);

  void setTab(int selectedTab) {
    switch (selectedTab) {
      case 0:
        return emit(NavigationState.home);
      case 1:
        return emit(NavigationState.video);
      case 2:
        return emit(NavigationState.chat);
      case 3:
        return emit(NavigationState.profile);
    }
  }
}
