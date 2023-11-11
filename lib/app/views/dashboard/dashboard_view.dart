import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';
import 'package:pongs/app/services/navigator_service/navigator_custom_service.dart';
import 'package:pongs/app/views/favorites/favorites_view.dart';
import 'package:pongs/app/views/home/home_view.dart';
import 'package:pongs/app/views/profile/profile_view.dart';
import 'package:pongs/app/views/search/search_view.dart';
import 'package:pongs/app/widgets/app_bar_custom/app_bar_custom_widget.dart';
import 'package:pongs/app/widgets/bottom_navigation_bar_custom/bottom_navigation_bar_custom_widget.dart';
import 'package:pongs/app/widgets/floating_action_button_custom/floating_action_button_custom_widget.dart';
import 'package:pongs/app/widgets/safe_area_custom/safe_area_custom_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  List<Widget> pages = const [
    HomeView(),
    SearchView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustomWidget(
        preferredSize: Size.fromHeight(65.0),
        child: SafeAreaCustomWidget(),
      ),
      backgroundColor: const Color(0xFFFFF2DF),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {},
      ),
      body: pages[currentIndex],
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
