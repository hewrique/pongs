import 'package:pongs/app/models/game_model/game_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucess extends HomeState {
  final List<GameModel> listGame;

  HomeSucess(this.listGame);
}

class HomeError extends HomeState {}
