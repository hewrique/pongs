import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pongs/app/models/game_model/game_model.dart';
import 'package:pongs/app/services/url_constants/url_constants.dart';

class HomeRepository {
  late DatabaseReference _firebaseDatabaseRef;
  late StreamSubscription<DatabaseEvent> _messagesSubscription;

  Future setUser({required String userUid, required Map userModel}) async {
    var urlPath = '${PrivateStringUrl.users}$userUid/dados do usuario/';

    _firebaseDatabaseRef = FirebaseDatabase.instance.ref().child(urlPath);

    await _firebaseDatabaseRef.push().set(userModel);
  }

  Future<List<GameModel>> getAllGames() async {
    Completer<List<GameModel>> completer = Completer<List<GameModel>>();

    List<GameModel> listGamesModel = [];

    _firebaseDatabaseRef =
        FirebaseDatabase.instance.ref().child(PublicStringUrl.todosOsJogos);

    _messagesSubscription = _firebaseDatabaseRef.onValue.listen(
      (DatabaseEvent event) {
        if(event.snapshot.value != null) {

        Map data = event.snapshot.value as Map;

        data.forEach((key, value) {
          GameModel gameModel = GameModel(
            key: key,
            gameId: value['gameId'],
            gameTitle: value['gameTitle'],
            thumbnail: value['thumbnail'],
            coverPhoto: value['coverPhoto'],
            materials: value['materials'],
            description: value['description'],
            amountOfPeople: value['amountOfPeople'],
            timePerRound: value['timePerRound'],
            howToPlay:
                List<String>.from((jsonDecode(value['howToPlay']) as List)),
          );

          listGamesModel.add(gameModel);
        });

        // Complete the Future when data is loaded
        completer.complete(listGamesModel);

        // Cancel the subscription to avoid memory leaks
        _messagesSubscription.cancel();

        }
      },
      onError: (Object o) {
        final error = o as FirebaseException;
        print('Error: ${error.code} ${error.message}');

        // Complete the Future with an error
        completer.completeError(error);

        // Cancel the subscription to avoid memory leaks
        _messagesSubscription.cancel();
      },
    );

    return completer.future;
  }
}
