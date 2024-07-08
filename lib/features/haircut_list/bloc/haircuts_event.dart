part of 'haircuts_bloc.dart';

@immutable
sealed class HaircutsEvent {}

class HaircutsInitialFetchEvent extends HaircutsEvent{}