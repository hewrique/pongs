import 'package:flutter/material.dart';
import 'package:pongs/app/icons/icons_pongs.dart';
import 'package:pongs/app/utils/popup/popup_utils.dart';
import 'package:pongs/app/widgets/filter/filter.dart';

class SafeAreaCustomWidget extends StatelessWidget {
  const SafeAreaCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 29.0,
          right: 29.0,
          top: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Utils.showPopup(const FilterWidget(), context);
              },
              child: const Icon(
                IconsPongs.filter,
                size: 30,
                color: Color(0xFF611313),
              ),
            ),
            const Text(
              'Pongs!',
              style: TextStyle(
                fontFamily: "Lobster",
                fontWeight: FontWeight.w400,
                fontSize: 36,
                color: Color(0xFF611313),
              ),
            ),
            const Icon(
              IconsPongs.dice_multiple,
              size: 35,
              color: Color(0xFF611313),
            )
          ],
        ),
      ),
    );
  }
}
