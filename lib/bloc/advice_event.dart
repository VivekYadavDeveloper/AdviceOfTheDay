part of 'advice_bloc.dart';

abstract class AdviceEvent extends Equatable {
  const AdviceEvent();

  @override
  List<Object> get props => [];
}

class AdviceLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
