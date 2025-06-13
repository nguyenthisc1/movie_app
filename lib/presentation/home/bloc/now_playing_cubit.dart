import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecaes/get_now_playing_movies_usecase.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';

import 'package:movie_app/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call();

    returnedData.fold(
      (error) {
        emit(FailureLoadedNowPlayingMovies(errorMessage: error));
      },
      (data) {
        emit(NowPlayingMoviesLoaded(movies: data));
      },
    );
  }
}
