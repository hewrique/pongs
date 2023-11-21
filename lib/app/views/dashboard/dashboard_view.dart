import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongs/app/cubits/home_cubit/home_cubit.dart';
import 'package:pongs/app/views/favorites/favorites_view.dart';
import 'package:pongs/app/views/home/home_view.dart';
import 'package:pongs/app/views/add_new_game/add_new_game_view.dart';
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

  late final HomeCubit _cubit;

  int currentIndex = 0;

  List<Widget> pages = const [
    HomeView(),
    SearchView(),
    FavoritesView(),
    ProfileView(),
  ];

  @override
  void initState() {
    _cubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:   AppBarCustomWidget(
        preferredSize: Size.fromHeight(65.0),
        child: SafeAreaCustomWidget(onTap: (){
         _cubit.randomGame();
        },),
      ),
      backgroundColor: const Color(0xFFFFF2DF),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonWidget(
        onPressed: () {
          _showAlert(context);
        },
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

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddNewGameView()
    );
  }
}
