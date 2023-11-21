import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/cubits/create_account_cubit/create_account_state.dart';
import 'package:pongs/app/models/user_model/user_model.dart';
import 'package:pongs/app/repositories/home_repository/home_repository.dart';
import 'package:pongs/app/services/user_auth/firebase_auth_service/firebase_auth_service.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final HomeRepository _repository = HomeRepository();

  CreateAccountCubit() : super(CreateAccountInitial());

  void signUp({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {

        emit(
          CreateAccountSucess(
            title: 'Usuário $name',
            message: 'Cadastrado com sucesso',
          ),
        );
      

      _setUser(
        userUid: user.uid,
        userModel: UserModel(name: name, userName: userName, email: email),
      );
    } else {
      emit(
        CreateAccountError(
          title: 'Erro',
          message:
              'Não foi possível criar um usuário, tente novamente mais tarde',
        ),
      );
    }
  }

  Future<void> _setUser({
    required String userUid,
    required UserModel userModel,
  }) async {
    await _repository.setUser(userUid: userUid, userModel: userModel.toMap());
  }
}
