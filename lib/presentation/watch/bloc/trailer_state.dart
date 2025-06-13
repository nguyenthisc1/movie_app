import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController youtubePlayerController;
  TrailerLoaded({required this.youtubePlayerController});
}

class FailureLoadedTrailer extends TrailerState {
  final String errorMessage;
  FailureLoadedTrailer({required this.errorMessage});
}
