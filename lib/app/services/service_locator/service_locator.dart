import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_cubit.dart';
import 'package:pongs/app/cubits/home_cubit/home_cubit.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<GlobalKey<NavigatorState>>(
    GlobalKey<NavigatorState>(),
  );

  getIt.registerFactory(
    () => HomeCubit(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => AddNewGameCubit(
      getIt(),
    ),
  );
}


// Criar um widget separado para input pequeno
// madar Daniel criar a conta no firebase
// validar input login para aceitar caracteres de login
// salvar userUid no local storage
// enviar fotos do jogo para o locar storage do firebase OK
// Salvar jogo nos favoritos

