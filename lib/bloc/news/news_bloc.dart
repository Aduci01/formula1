import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formula1/models/news_model.dart';
import 'package:formula1/services/api_manager.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiManager apiManager = ApiManager();

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is GetNewsList) {
        try {
          emit(NewsLoading());

          var newsResult = await apiManager.getNews();

          emit(NewsLoaded(newsResult));
        } catch (e) {
          print(e.toString());
        }
      }
    });
  }
}
