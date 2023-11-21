abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucess extends LoginState {}

class LoginError extends LoginState {
  final String title;
  final String message;
  LoginError({required this.title, required this.message});
}
