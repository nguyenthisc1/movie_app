import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/cubic/generic_data_cubic.dart';
import 'package:movie_app/common/cubic/generic_data_state.dart';
import 'package:movie_app/common/wigets/tv/tv_card.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tv_usecase.dart';
import 'package:movie_app/service_locator.dart';

class SimilarTVs extends StatelessWidget {
  final int tvId;
  const SimilarTVs({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<TVEntity>>(
                sl<GetSimilarTVUseCase>(),
                params: tvId,
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
                  'Similar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TVCard(tvEntity: state.data[index]);
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
