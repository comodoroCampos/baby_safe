part of 'tutor_bloc.dart';

abstract class TutorState extends Equatable {
  const TutorState();
  
  @override
  List<Object> get props => [];
}

class TutorInitial extends TutorState {}
