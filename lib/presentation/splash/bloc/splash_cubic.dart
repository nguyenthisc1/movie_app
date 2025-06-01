import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';

class SplashCubic extends Cubit<SplashState> {
  SplashCubic() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    emit(UnAuthenticated());
  }
}
