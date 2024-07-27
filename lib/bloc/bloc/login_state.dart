part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class Loading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class UnAuthentificated extends LoginState {
  @override
  List<Object?> get props => [];
}
