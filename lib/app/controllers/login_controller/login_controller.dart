import 'package:firebase_auth/firebase_auth.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/services/user_auth/firebase_auth_service/firebase_auth_service.dart';
import 'package:pongs/app/views/dashboard/dashboard_view.dart';

class LoginController {
  final FirebaseAuthService _auth = FirebaseAuthService();

  void signIn({required String email, required String password}) async {
   
    User? user =
        await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      print('Login efetuado com sucesso, uid: ${user.uid}');

      NavigatorCustomService.pushAndRemoveUntil(
        pageName: const DashboardView(),
      );
    } else {
      print('Erro ao fazer Login');
    }
  }
}
