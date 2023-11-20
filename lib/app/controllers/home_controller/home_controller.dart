// import 'dart:async';
// import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:pongs/app/models/game_model/game_model.dart';
// import 'package:pongs/app/services/url_constants/url_constants.dart';

// class HomeController {
//   late DatabaseReference _firebaseDatabaseRef;
//   late StreamSubscription<DatabaseEvent> _messagesSubscription;


//   void cancelarMessagesSubscription() {
//     // Cancel the subscription to avoid memory leaks
//     _messagesSubscription.cancel();
//   }

  // Future<bool> setGamerUser() async {
  //   var userUid = 'rSj7E2RRg8cJ4HM6ZDldiKgU2qJ3';
  //   var urlPath =
  //       '${PrivateStringUrl.users}$userUid${NomeDaPastaPrivada.usuarioLogado}${NomeDaPastaPrivada.jogosPostadosPeloUsuario}';
  //   bool result = false;

  //   Map map = {
  //     'gameId': 'wwwww',
  //     'gameTitle': 'jogo teste 2',
  //     'thumbnail': "xxxxxxxxx",
  //     'coverPhoto': 'zzzzzzzzzzzz',
  //     'materials': 'blábláblá',
  //     'description': 'Ovo Ovo Ovo Ovo Ovo Ovo Ovo Ovo Ovo Ovo ',
  //     'amountOfPeople': '2 pessoas',
  //     'timePerRound': '3 horas',
  //     'howToPlay':
  //         jsonEncode(["lista 1", "lista 2", "lista 3", "lista 4", "lista 5"]),
  //   };

  //   _firebaseDatabaseRef = FirebaseDatabase.instance.ref().child(urlPath);

  //   await _firebaseDatabaseRef.push().set(map).whenComplete(() {
  //     result = true;
  //   });

  //   setGamerAll(map);

  //   return result;
  // }

  // Future setGamerAll(Map map) async {
  //   var urlPath = PublicStringUrl.todosOsJogos;

  //   _firebaseDatabaseRef = FirebaseDatabase.instance.ref().child(urlPath);

  //   await _firebaseDatabaseRef.push().set(map);
  // }


  // Future<List<GameModel>> getAllGames() async {
  //   Completer<List<GameModel>> completer = Completer<List<GameModel>>();

  //   List<GameModel> listGamesModel = [];

  //   _firebaseDatabaseRef =
  //       FirebaseDatabase.instance.ref().child(PublicStringUrl.todosOsJogos);

  //   _messagesSubscription = _firebaseDatabaseRef.onValue.listen(
  //     (DatabaseEvent event) {
  //       Map data = event.snapshot.value as Map;

  //       data.forEach((key, value) {
  //         GameModel gameModel = GameModel(
  //           key: key,
  //           gameId: value['gameId'],
  //           gameTitle: value['gameTitle'],
  //           thumbnail: value['thumbnail'],
  //           coverPhoto: value['coverPhoto'],
  //           materials: value['materials'],
  //           description: value['description'],
  //           amountOfPeople: value['amountOfPeople'],
  //           timePerRound: value['timePerRound'],
  //           howToPlay: List<String>.from(
  //               (jsonDecode(value['howToPlay']) as List)),
  //         );

  //         listGamesModel.add(gameModel);
  //       });

  //       // Complete the Future when data is loaded
  //       completer.complete(listGamesModel);
  //     },
  //     onError: (Object o) {
  //       final error = o as FirebaseException;
  //       print('Error: ${error.code} ${error.message}');

  //       // Complete the Future with an error
  //       completer.completeError(error);
  //     },
  //   );

  //   return completer.future;
  // }

// }
