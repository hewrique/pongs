import 'package:flutter/widgets.dart';
import 'package:pongs/app/widgets/loading_animation/loading_animation_widget.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child:  Image.asset("assets/img/logo/logo_full_transparent.png"),
          ),
        ),
        const LoadingAnimationWidgetCustom(
          leftDotColor: Color(0xFFFFC928),
          rightDotColor: Color(0xFFFFC928),
          leftBorderDotColor: Color(0xFF000000),
          rightBorderDotColor: Color(0xFF000000),
          borderWidth: 3,
          borderStyle: BorderStyle.solid,
          size: 28,
        ),
      ],
    );
  }
}
