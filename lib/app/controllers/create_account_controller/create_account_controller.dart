import 'package:firebase_auth/firebase_auth.dart';
import 'package:pongs/app/models/user_model/user_model.dart';
import 'package:pongs/app/repositories/home_repository/home_repository.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/services/user_auth/firebase_auth_service/firebase_auth_service.dart';
import 'package:pongs/app/views/login/login_view.dart';

class CreateAccountController {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final HomeRepository _repository = HomeRepository();

  void signUp({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print('Usuário criado com sucesso, uid: ${user.uid}');

      _setUser(
        userUid: user.uid,
        userModel: UserModel(name: name, userName: userName, email: email),
      );

      Future.delayed(const Duration(seconds: 2), () {
        NavigatorCustomService.pushAndRemoveUntilFadeTransition(
          pageName: const LoginView(),
        );
      });
    } else {
      print('Erro ao criar usuário');

      Future.delayed(const Duration(seconds: 2), () {
        NavigatorCustomService.pushAndRemoveUntilFadeTransition(
          pageName: const LoginView(),
        );
      });
    }
  }

  Future<void> _setUser({
    required String userUid,
    required UserModel userModel,
  }) async {
    await _repository.setUser(userUid: userUid, userModel: userModel.toMap());
  }
}
