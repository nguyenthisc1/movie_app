import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/cubic/generic_data_cubic.dart';
import 'package:movie_app/common/cubic/generic_data_state.dart';
import 'package:movie_app/common/wigets/movies/movie_card.dart';
import 'package:movie_app/domain/movie/entities/movie_entity.dart';
import 'package:movie_app/domain/movie/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_app/service_locator.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<MovieEntity>>(
                sl<GetRecommendationMoviesUseCase>(),
                params: movieId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded && state.data.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.data[index]);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
