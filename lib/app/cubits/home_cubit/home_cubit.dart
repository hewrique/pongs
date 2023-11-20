import 'package:bloc/bloc.dart';
import 'package:pongs/app/cubits/home_cubit/home_state.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/repositories/home_repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  List<GameModel> listGame = [];

  HomeCubit(this._repository) : super(HomeInitial());

  Future receiveAllGames() async {
    emit(HomeLoading());
    listGame = await _repository.getAllGames();

    if (listGame.isNotEmpty) {
      emit(HomeSucess(listGame));
    }
  }

}
