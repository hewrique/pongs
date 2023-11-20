import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/utils/list_all_games_global/list_all_games_global.dart';

class SearchInputController {
  List<GameModel> listSearchInputAllGames = [];
  List<String> listIdsGames = [];

  void filterGames(String value) {
    for (var item in ListAllGamesGlobal.listAllGamesGlobal) {
      if (value == '') {
        listSearchInputAllGames.clear();
        listIdsGames.clear();
      } else if (item.gameTitle.contains(value.toLowerCase()) ||
          item.gameTitle.contains(value.toUpperCase())) {
        if (!listIdsGames.contains(item.gameId)) {
          listSearchInputAllGames.add(item);
          listIdsGames.add(item.gameId);
        } else {
          listSearchInputAllGames.clear();
          listIdsGames.clear();
        }
      }
    }
  }
}
