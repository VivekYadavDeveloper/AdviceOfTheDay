
import 'package:advice_status/repo/api_class.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../API Model/advice_model.dart';

part 'advice_event.dart';
part 'advice_state.dart';

class AdviceBloc extends Bloc<AdviceLoadedEvent, AdviceState> {
  final AdviceRepo adviceRepo;

  AdviceBloc(this.adviceRepo) : super(AdviceInitial()) {
    on<AdviceLoadedEvent>((event, emit) async {
      try {
        emit(AdviceLoadingState());
        var res = await adviceRepo.getAdviceData();
        emit(AdviceLoadedState(res));
      } catch (e) {
        emit(AdviceErrorState(e.toString()));
      }
    });
  }
}
