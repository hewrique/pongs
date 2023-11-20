import 'package:flutter/material.dart';
import 'package:pongs/app/controllers/search_input_controller/search_input_controller.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/utils/debouncer_utils/debouncer_utils.dart';
import 'package:pongs/app/utils/list_all_games_global/list_all_games_global.dart';
import 'package:pongs/app/views/game_preview/game_preview_view.dart';
import 'package:pongs/app/widgets/card_home/card_home_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchInputController _searchInputController = SearchInputController();
  final Debouncer _debouncer = Debouncer(milliseconds: 300);
  List<GameModel> listSearchInputAllGames = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 15),
              child: Container(
                  width: 350.0,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFCE86),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: TextFormField(
                    autofocus: false,
                    maxLines: 1,
                    onChanged: (value) {
                      // _debouncer.run(() {
                        _searchInputController.filterGames(value);

                        setState(() {});
                      //   print("Handling input: $value");
                      // });
                    },
                    style: const TextStyle(
                        fontFamily: "Poppins", color: Color(0xFF611313)),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Color(0xFF611313)),
                  )),
            ),
            _searchInputController.listSearchInputAllGames.isEmpty
                ? Container()
                : ListView.builder(
                    itemCount:
                        _searchInputController.listSearchInputAllGames.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item =
                          _searchInputController.listSearchInputAllGames[index];
                      return CardHomeWidget(
                        thumbnail: item.thumbnail,
                        gameTitle: item.gameTitle,
                        description: item.description,
                        onClick: () => NavigatorCustomService.push(
                          pageName: GamePreviewView(
                            gameId: item.gameId,
                            thumbnail: item.thumbnail,
                            coverPhoto: item.coverPhoto,
                            gameTitle: item.gameTitle,
                            materials: item.materials,
                            description: item.description,
                            amountOfPeople: item.amountOfPeople,
                            timePerRound: item.timePerRound,
                            howToPlay: item.howToPlay.toList(),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }

  void filterGames(dynamic value) {
    for (var item in ListAllGamesGlobal.listAllGamesGlobal) {
      if (item.gameTitle.contains(value, 0)) {
        listSearchInputAllGames.add(item);
      }
      // return null;
    }
  }
}
