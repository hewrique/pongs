import 'package:bloc/bloc.dart';
import 'package:pongs/app/cubits/home_cubit/home_state.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/repositories/home_repository/home_repository.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/utils/list_all_games_global/list_all_games_global.dart';
import 'package:pongs/app/views/game_preview/game_preview_view.dart';

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

  void randomGame() {
    List<GameModel> newList = ListAllGamesGlobal.listAllGamesGlobal..shuffle();

      NavigatorCustomService.push(
        pageName: GamePreviewView(
          gameId: newList[0].gameId,
          thumbnail: newList[0].thumbnail,
          coverPhoto: newList[0].coverPhoto,
          gameTitle: newList[0].gameTitle,
          materials: newList[0].materials,
          description: newList[0].description,
          amountOfPeople: newList[0].amountOfPeople,
          timePerRound: newList[0].timePerRound,
          howToPlay: newList[0].howToPlay.toList(),
        ),
      );
    
  }
}
