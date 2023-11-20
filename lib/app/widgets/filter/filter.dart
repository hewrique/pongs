import 'package:flutter/material.dart';
import 'package:pongs/app/icons/icons_pongs.dart';
import 'package:pongs/app/widgets/input_custom/input_custom_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 75.0),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 262,
              height: 284,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFF2DF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(IconsPongs.filter),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('Filtar por:'),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Quantidade de pessoas:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          IconsPongs.decrement,
                          color: Color(0xFF611313),
                        ),
                        InputCustomWidget(
                          customWidth: 60,
                          paddingTop: 2.0,
                        ),
                        Icon(IconsPongs.increment, color: Color(0xFF611313)),
                      ],
                    ),
                  ),
                  const Text('Tempo por rodada'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(IconsPongs.decrement,
                            color: Color(0xFF611313)),
                      ),
                      const InputCustomWidget(
                        customWidth: 60,
                        paddingTop: 2.0,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(IconsPongs.increment,
                              color: Color(0xFF611313))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
