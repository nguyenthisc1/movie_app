import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/cubic/generic_data_cubic.dart';
import 'package:movie_app/common/cubic/generic_data_state.dart';
import 'package:movie_app/common/wigets/tv/tv_card.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/service_locator.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()
                ..getData<List<TVEntity>>(sl<GetPopularTVUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: const CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: state.data.length,
              ),
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
