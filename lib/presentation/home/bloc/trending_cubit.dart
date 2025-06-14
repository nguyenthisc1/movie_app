import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    if (isClosed) return;

    try {
      final returnedData = await sl<GetTrendingMoviesUseCase>().call();

      if (isClosed) return;

      returnedData.fold(
        (error) => emit(FailureLoadedTrendingMovies(errorMessage: error)),
        (data) => emit(TrendingMoviesLoaded(movies: data)),
      );
    } catch (e) {
      if (!isClosed) {
        emit(FailureLoadedTrendingMovies(errorMessage: e.toString()));
      }
    }
  }
}
