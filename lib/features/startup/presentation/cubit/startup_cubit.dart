import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';

part 'startup_state.dart';

@Injectable()
class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(const StartupState());

  Future<void> initializeApp() async {
    emit(StartupState(status: StartupStatus.loading));
    try {
      // Simulate some startup work like fetching initial data or configurations
      await Future.delayed(const Duration(seconds: 2));
      emit(StartupState(status: StartupStatus.success));
    } catch (e) {
      emit(StartupState(
          status: StartupStatus.failure,
          failure: FailureWithMessage(e.toString())));
    }
  }
}
