part of 'results_bloc.dart';

abstract class ResultsEvent extends Equatable {
  const ResultsEvent();
}

class GetResults extends ResultsEvent {
  final int year;

  const GetResults(this.year);

  @override
  List<Object> get props => [];
}
