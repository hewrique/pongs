import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pongs/app/cubits/add_new_game_cubit/add_new_game_cubit.dart';
import 'package:pongs/app/cubits/home_cubit/home_cubit.dart';
import 'package:pongs/app/repositories/add_new_game_repository/add_new_game_repository.dart';
import 'package:pongs/app/repositories/home_repository/home_repository.dart';
import 'package:pongs/app/views/splash_screen/splash_screen_view.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final navigatorKey = getIt.get<GlobalKey<NavigatorState>>();

    return MultiProvider(
      providers: [
        Provider<HomeCubit>(create: (_) => HomeCubit(HomeRepository())),
        Provider<AddNewGameCubit>(create: (_) => AddNewGameCubit(AddNewGameRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
        ),
        home: SplashScreenView(context: context),
      ),
    );
  }
}
