part of 'haircuts_bloc.dart';

@immutable
sealed class HaircutsState {}

abstract class HaircutsActionState extends HaircutsState {}

final class HaircutsInitial extends HaircutsState {}

final class HaircutsFetchingLoadingState extends HaircutsState {}

final class HaircutsFetchingErrorState extends HaircutsState {
  final String error;

  HaircutsFetchingErrorState({required this.error});
}

final class HaircutsFetchedState extends HaircutsState {
  final List<Haircut> haircuts;

  HaircutsFetchedState({required this.haircuts});
}
