import 'package:flutter/material.dart';
import 'package:pongs/app/icons/pongs_icons.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  final Function(int) onTap;
  const BottomNavigationBarCustom({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFB74E),
        selectedItemColor: const Color(0xFF611313),
        unselectedItemColor: const Color(0xFF611313),
        onTap: widget.onTap,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              IconsPongs.home_variant,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: Icon(
                IconsPongs.search,
                size: 32,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Icon(
                IconsPongs.heart,
                size: 32,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              IconsPongs.account_circle,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
