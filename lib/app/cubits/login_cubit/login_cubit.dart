import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/cubits/login_cubit/login_state.dart';
import 'package:pongs/app/services/user_auth/firebase_auth_service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  LoginCubit() : super(LoginInitial());

  void signIn({required String email, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (email.isEmpty || password.isEmpty) {
      emit(LoginError(
        title: 'Erro!',
        message: 'Para entrar digite seu e-mail e senha',
      ));
    } else if (user != null) {
      prefs.setString('loginUserId', user.uid);

      emit(LoginSucess());
    } else {
      emit(LoginError(
        title: 'Erro!',
        message: 'Login ou senha incorreto',
      ));
    }
  }
}
