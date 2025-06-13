import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/entities/movie_trailer_entity.dart';
import 'package:movie_app/domain/movie/usecaes/get_trailer_movie_usecase.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getTrailerMovie() async {
    var returnedData = await sl<GetTrailerMovieUseCase>().call();

    returnedData.fold(
      (error) {
        emit(FailureLoadedTrailer(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );

        emit(TrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
