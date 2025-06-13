import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecaes/get_trending_movies_usecase.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(FailureLoadedTrendingMovies(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }

  getNowPlayingMovies() {}
}
