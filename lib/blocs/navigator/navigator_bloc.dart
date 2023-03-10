import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(LandingScreenState()) {
    on<LandingScreenEvent>(
      (event, emit) {
        emit(LandingScreenState());
      },
    );
    on<LoginScreenEvent>(
      (event, emit) {
        emit(LoginScreenState());
      },
    );
    on<LoadingScreenEvent>(
      (event, emit) {
        emit(LoadingScreenState());
      },
    );
    on<HomeScreenEvent>(
      (event, emit) {
        emit(HomeScreenState());
      },
    );
    on<LogoutScreenEvent>(
      (event, emit) {
        emit(LogoutScreenState());
      },
    );
  }
}
