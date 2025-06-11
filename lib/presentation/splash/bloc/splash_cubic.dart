import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/auth/usecaes/is_logged_in.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';
import 'package:movie_app/service_locator.dart';

class SplashCubic extends Cubit<SplashState> {
  SplashCubic() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();

    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }

    emit(UnAuthenticated());
  }
}
