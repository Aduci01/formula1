import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formula1/models/circuit_model.dart';
import 'package:formula1/services/api_manager.dart';

part 'circuits_event.dart';
part 'circuits_state.dart';

class CircuitsBloc extends Bloc<CircuitsEvent, CircuitsState> {
  final ApiManager apiManager = ApiManager();

  CircuitsBloc() : super(CircuitsInitial()) {
    on<CircuitsEvent>((event, emit) async {
      if (event is GetCircuitsList) {
        try {
          emit(CircuitsLoading());

          var circuitResult = await apiManager.getCircuits();

          emit(CircuitsLoaded(circuitResult));
        } catch (e) {
          print(e.toString());
        }
      }
    });
  }
}
