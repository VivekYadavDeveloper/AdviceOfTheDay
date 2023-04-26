part of 'advice_bloc.dart';

abstract class AdviceState extends Equatable {
  const AdviceState();

  @override
  List<Object> get props => [];
}

class AdviceInitial extends AdviceState {}

class AdviceLoadingState extends AdviceState {}

class AdviceLoadedState extends AdviceState {
  final AdviceModel adviceModel;

  const AdviceLoadedState(this.adviceModel);
  @override
  List<Object> get props => [adviceModel];
}

class AdviceErrorState extends AdviceState {
  final String errorMessage;

  const AdviceErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
