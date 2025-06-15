import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/cubic/generic_data_state.dart';
import 'package:movie_app/core/usecase/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  Future<void> getData<T>(UseCase usecase, {dynamic params}) async {
    if (isClosed) return;

    try {
      var returnedData = await usecase.call(params: params);
      if (isClosed) return;

      returnedData.fold(
        (error) {
          if (!isClosed) {
            emit(FailureLoadData(errorMessage: error));
          }
        },
        (data) {
          if (!isClosed) {
            emit(DataLoaded<T>(data: data));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(FailureLoadData(errorMessage: e.toString()));
      }
    }
  }
}
