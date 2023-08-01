import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  TutorBloc() : super(TutorInitial()) {
    on<TutorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
