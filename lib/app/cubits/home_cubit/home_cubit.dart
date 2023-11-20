import 'package:bloc/bloc.dart';
import 'package:pongs/app/cubits/home_cubit/home_state.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/repositories/repository/repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final Repository _repository;

  List<GameModel> listGame = [];

  HomeCubit(this._repository) : super(HomeInitial());

  Future receiveAllGames() async {
    emit(HomeLoading());
    listGame = await _repository.getAllGames();

    if (listGame.isNotEmpty) {
      emit(HomeSucess(listGame));
    }
  }

// Não está sendo usado possivelmente apagar
  Future<void> sendGame() async {
    bool sendGameuser = await _repository.setGamerUser();
    bool sendGameAll = await _repository.setGamerAll();

    if (sendGameuser && sendGameAll) {
      receiveAllGames();
    }
  }
}
