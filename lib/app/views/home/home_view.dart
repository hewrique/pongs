import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';
import 'package:pongs/app/widgets/app_bar_custom/app_bar_custom_widget.dart';
import 'package:pongs/app/widgets/bottom_navigation_bar_custom/bottom_navigation_bar_custom_widget.dart';
import 'package:pongs/app/widgets/card_home/card_home_widget.dart';
import 'package:pongs/app/widgets/floating_action_button_custom/floating_action_button_custom_widget.dart';
import 'package:pongs/app/widgets/safe_area_custom/safe_area_custom_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  
  List<Widget> pages = const [
    Icon(IconsPongs.home_variant, size: 60, color: Color(0xFF611313)),
    Icon(IconsPongs.search, size: 60, color: Color(0xFF611313)),
    Icon(IconsPongs.heart, size: 60, color: Color(0xFF611313)),
    Icon(IconsPongs.account_circle, size: 60, color: Color(0xFF611313)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomWidget(
        preferredSize: Size.fromHeight(65.0),
        child: SafeAreaCustomWidget(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {},
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CardHomeWidget(),
              CardHomeWidget(),
              CardHomeWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarCustom(
        onTap: (int newIndex) {
          setState(
            () {
              currentIndex = newIndex;
            },
          );
        },
      ),
    );
  }
}
