part of 'circuits_bloc.dart';

abstract class CircuitsEvent extends Equatable {
  const CircuitsEvent();
}

class GetCircuitsList extends CircuitsEvent {
  @override
  List<Object> get props => [];
}
