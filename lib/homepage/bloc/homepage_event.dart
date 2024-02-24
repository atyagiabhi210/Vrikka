part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}


class PageChangeEvent extends HomepageEvent{
  final int index;
  PageChangeEvent({required this.index});
}
