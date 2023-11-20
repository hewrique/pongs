import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/cubits/home_cubit/home_cubit.dart';
import 'package:pongs/app/cubits/home_cubit/home_state.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/services/service_locator/service_locator.dart';
import 'package:pongs/app/views/game_preview/game_preview_view.dart';
import 'package:pongs/app/widgets/card_home/card_home_widget.dart';
import 'package:pongs/app/widgets/loading_icon/loading_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<HomeCubit>()..receiveAllGames();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt.get<HomeCubit>(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<HomeCubit, HomeState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const LoadingIcon();
                }

                if (state is HomeError) {
                  print("Erro ao receber lista.");
                }

                if (state is HomeSucess) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                      itemCount: state.listGame.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = state.listGame[index];
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
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        },
      ),
    );
  }
}
