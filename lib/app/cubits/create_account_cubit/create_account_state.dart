abstract class CreateAccountState {}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSucess extends CreateAccountState {
  final String title;
  final String message;
  CreateAccountSucess({required this.title, required this.message});
}

class CreateAccountError extends CreateAccountState {
  final String title;
  final String message;
  CreateAccountError({required this.title, required this.message});
}
