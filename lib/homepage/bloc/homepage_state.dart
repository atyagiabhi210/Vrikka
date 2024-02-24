part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState {}

abstract class _HomepageState extends HomepageState {
  final int index;
  _HomepageState({required this.index});
}

final class HomepageInitial extends HomepageState {}

class _HomePageInitial extends _HomepageState {
  _HomePageInitial({required int index}) : super(index: index);
}