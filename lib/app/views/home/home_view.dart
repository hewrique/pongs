import 'package:flutter/material.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/game_preview/game_preview_view.dart';
import 'package:pongs/app/widgets/card_home/card_home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CardHomeWidget(
          onClick: () => NavigatorCustomService.push(
              pageName: const GamePreviewView(), context: context),
        );
      },
    );
  }
}
