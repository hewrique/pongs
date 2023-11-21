import 'package:flutter/material.dart';
import 'package:pongs/app/widgets/buttons%20_game_preview/buttons%20_game_preview_widget.dart';
import 'package:pongs/app/widgets/card_game_description/card_game_description_widget.dart';
import 'package:pongs/app/widgets/card_game_rules/card_game_rules_widget.dart';
import 'package:pongs/app/widgets/loading_animation/loading_animation_widget.dart';

class GamePreviewView extends StatefulWidget {
  final String gameId;
  final String thumbnail;
  final String coverPhoto;
  final String gameTitle;
  final List<String> materials;
  final String description;
  final int amountOfPeople;
  final int timePerRound;
  final List<String> howToPlay;

  const GamePreviewView({
    super.key,
    required this.gameId,
    required this.thumbnail,
    required this.coverPhoto,
    required this.gameTitle,
    required this.materials,
    required this.description,
    required this.amountOfPeople,
    required this.timePerRound,
    required this.howToPlay,
  });

  @override
  State<GamePreviewView> createState() => _GamePreviewViewState();
}

class _GamePreviewViewState extends State<GamePreviewView> {
  late double heightCustom;

  @override
  void didChangeDependencies() {
    heightCustom = MediaQuery.of(context).size.height * 0.35;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFFFFB74E),
            width: double.maxFinite,
            height: heightCustom,
            child: const LoadingAnimationWidgetCustom(
              leftDotColor: Color(0xFFFFC928),
              rightDotColor: Color(0xFFFFC928),
              leftBorderDotColor: Color(0xFF000000),
              rightBorderDotColor: Color(0xFF000000),
              borderWidth: 3,
              borderStyle: BorderStyle.solid,
              size: 40,
            ),
          ),
          SizedBox(
            height: heightCustom,
            child: Image.network(widget.coverPhoto, fit: BoxFit.cover),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 1.0,
            builder: (context, controller) => ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: Container(
                color: const Color(0xFFFFF2DF),
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: ListView(
                  controller: controller,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        const ButtonsTopGamePreviewWidget(),
                        CardGameDescriptionWidget(
                          thumbnail: widget.thumbnail,
                          gameTitle: widget.gameTitle,
                          materials: widget.materials,
                          description: widget.description,
                          amountOfPeople: widget.amountOfPeople,
                          timePerRound: widget.timePerRound,
                        ),
                        CardGameRulesWidget(
                          howToPlay: widget.howToPlay,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
