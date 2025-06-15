import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/cubic/generic_data_cubic.dart';
import 'package:movie_app/common/cubic/generic_data_state.dart';
import 'package:movie_app/core/entities/keyword_entity.dart';
import 'package:movie_app/domain/tv/usecases/get_keyword_tv_usecase.dart';

import '../../../service_locator.dart';

class KeywordTV extends StatelessWidget {
  final int tvId;
  const KeywordTV({required this.tvId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<KeywordEntity>>(
                sl<GetKeywordTVUseCase>(),
                params: tvId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            List<KeywordEntity> keywords = state.data;
            return Wrap(
              spacing: 5,
              children:
                  keywords
                      .map((item) => Chip(label: Text(item.name!)))
                      .toList(),
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
