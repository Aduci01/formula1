part of 'results_bloc.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();

  @override
  List<Object> get props => [];
}

class ResultsInitial extends ResultsState {
  @override
  List<Object> get props => [];
}

class ResultsLoading extends ResultsState {
  @override
  List<Object> get props => [];
}

class ResultsLoaded extends ResultsState {
  final List<Result> model;
  const ResultsLoaded(this.model);

  @override
  List<Object> get props => model;
}
