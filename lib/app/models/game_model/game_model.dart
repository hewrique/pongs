import 'dart:convert';

class GameModel {
  final String gameId;
  final String gameTitle;
  final String thumbnail;
  final String coverPhoto;
  final List<String> materials;
  final String description;
  final int amountOfPeople;
  final int timePerRound;
  final List<String> howToPlay;
  final String? key;

  GameModel({
    required this.gameId,
    required this.gameTitle,
    required this.thumbnail,
    required this.coverPhoto,
    required this.materials,
    required this.description,
    required this.amountOfPeople,
    required this.timePerRound,
    required this.howToPlay,
    this.key,
  });


  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'gameId': gameId,
      'gameTitle': gameTitle,
      'thumbnail': thumbnail,
      'coverPhoto': coverPhoto,
      'materials': jsonEncode(materials) ,
      'description': description,
      'amountOfPeople': amountOfPeople,
      'timePerRound': timePerRound,
      'howToPlay': jsonEncode(howToPlay),
    };

    return map;
  }
}

