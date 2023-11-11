import 'package:flutter/material.dart';
import 'package:pongs/app/widgets/buttons%20_game_preview/buttons%20_game_preview_widget.dart';
import 'package:pongs/app/widgets/card_game_description/card_game_description_widget.dart';
import 'package:pongs/app/widgets/card_game_rules/card_game_rules_widget.dart';
import 'package:pongs/app/widgets/loading_animation/loading_animation_widget.dart';

class GamePreviewView extends StatefulWidget {
  const GamePreviewView({super.key});

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
            child: 
                const LoadingAnimationWidgetCustom(
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
            child: Image.network(
              'https://s3-alpha-sig.figma.com/img/2a1e/4965/9db67974408ddc03c820f10bff48478b?Expires=1700438400&Signature=IYaA89PgK1z7NFQLAOp2GgiemN6A1oCbXqEBROt-r531OOf~ANzJgGWwY2zsJvNVQrPXNfL-LFyQiwwDoxCbLIp3vbMKVGdS44BL9sO6-o55pDNGDQeuaEcTbr8Sl8y84QI0xXgCnmU1VVcOBGd~HnIOqQSt0LZFvitaWVSKR4SOQnvKgoMPZOgSzMxNWysuH~KRn~RgGCz3NBUmfnWllOLxL360JaycPfeZlWj6ZlfQldDi9ngil1kS5iKTQS6dHgJNmmdtyPuebcSsp1f0ZA1htbR-vv5vpqT7PLyyKKq7h1O0hwcc9SlW5JvXtxYoCDLfyq1bHB6RrXwcSpAcOw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
              fit: BoxFit.cover,
            ),
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
                        const ButtonsGamePreviewWidget(),
                        const CardGameDescriptionWidget(),
                        CardGameRulesWidget(
                          listGames: listGames,
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

  List<String> listGames = [
    "Todos os jogadores se reúnem na cozinha, prontos para a ação.",
    "O jogador da vez lança o dado. O número que aparecer determina quantos itens ´guloseima´ os outros jogadores terão que preparar para ele.",
    "Os itens ´guloseima´ podem variar e devem ser decididos previamente pelo grupo. Por exemplo, vocês podem escolher criar pequenas combinações de alimentos inusitados, como um pedaço de pão com ketchup e uma gota de mostarda.",
    "Se o jogador escolher comer, todos os outros jogadores devem tomar uma bebida como consequência.",
    "Se o jogador optar por não comer, então ele mesmo deve tomar uma bebida como punição.",
    "O jogo prossegue dessa forma, com os jogadores rolando o dado e enfrentando os desafios engraçados criados pelos números.",
  ];
}
