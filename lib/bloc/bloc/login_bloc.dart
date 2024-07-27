import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sgbe/data/repository/authRepository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(UnAuthentificated()) {
    on<LoginRequested>((event, state) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
      } catch (e) {
        emit(UnAuthentificated());
      }
    });
  }
}
