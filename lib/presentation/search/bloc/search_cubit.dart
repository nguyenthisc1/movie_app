import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/entities/movie_entity.dart';
import 'package:movie_app/domain/movie/usecases/search_movie_usecase.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_app/domain/tv/usecases/search_tv_usecase.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController textEditingController = TextEditingController();

  List<MovieEntity> _cachedMovies = [];
  List<MovieEntity> get cachedMovies => _cachedMovies;

  List<TVEntity> _cachedTvs = [];
  List<TVEntity> get cachedTvs => _cachedTvs;

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());
      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);
    returnedData.fold(
      (errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      },
      (data) {
        _cachedMovies = data; // Cache lại
        emit(MoviesLoaded(movies: data));
      },
    );
  }

  void searchTV(String query) async {
    var returnedData = await sl<SearchTVUseCase>().call(params: query);
    returnedData.fold(
      (errorMessage) {
        emit(SearchFailure(errorMessage: errorMessage));
      },
      (data) {
        _cachedTvs = data; // Cache lại
        emit(TVsLoaded(tvs: data));
      },
    );
  }

  void restoreMovieResults() {
    if (_cachedMovies.isNotEmpty) {
      emit(MoviesLoaded(movies: _cachedMovies));
    }
  }

  void restoreTvResults() {
    if (_cachedTvs.isNotEmpty) {
      emit(TVsLoaded(tvs: _cachedTvs));
    }
  }
}
