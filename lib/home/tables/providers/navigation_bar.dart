import 'package:riverpod_annotation/riverpod_annotation.dart';

part "navigation_bar.g.dart";

@riverpod
class NavigationBar extends _$NavigationBar {
  @override
  int build() => 0;

  void setNavigationBar(int index) {
    state = index;
  }
}