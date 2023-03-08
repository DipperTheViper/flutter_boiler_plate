import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_event.dart';

part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorState> {
  NavigatorBloc() : super(NavigatorInitial()) {
    on<NavigatorEvent>(
      (event, emit) {
        // TODO: implement event handler
      },
    );
  }
}
