import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formula1/models/driver_ranking.dart';
import 'package:formula1/services/api_manager.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final ApiManager apiManager = ApiManager();

  ResultsBloc() : super(ResultsInitial()) {
    on<ResultsEvent>((event, emit) async {
      if (event is GetResults) {
        try {
          emit(ResultsLoading());

          var newsResult = await apiManager.getResults(event.year);

          emit(ResultsLoaded(newsResult));
        } catch (e) {
          print(e.toString());
        }
      }
    });
  }
}
