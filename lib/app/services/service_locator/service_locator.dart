import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_cubit.dart';
import 'package:pongs/app/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:pongs/app/cubits/home_cubit/home_cubit.dart';
import 'package:pongs/app/cubits/login_cubit/login_cubit.dart';

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
    () => LoginCubit(),
  );

  getIt.registerFactory(
    () => CreateAccountCubit(),
  );

  getIt.registerFactory(
    () => AddNewGameCubit(
      getIt(),
    ),
  );
}
