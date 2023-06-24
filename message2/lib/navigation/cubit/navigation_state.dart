part of 'navigation_cubit.dart';

enum NavigationState {
  home(0),
  video(1),
  chat(2),
  profile(3);

  const NavigationState(this.tabIndex);

  final int tabIndex;
}
