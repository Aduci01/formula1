part of 'circuits_bloc.dart';

abstract class CircuitsState extends Equatable {
  const CircuitsState();

  @override
  List<Object> get props => [];
}

class CircuitsInitial extends CircuitsState {
  @override
  List<Object> get props => [];
}

class CircuitsLoading extends CircuitsState {
  @override
  List<Object> get props => [];
}

class CircuitsLoaded extends CircuitsState {
  final List<CircuitModel> model;
  const CircuitsLoaded(this.model);

  @override
  List<Object> get props => model;
}
