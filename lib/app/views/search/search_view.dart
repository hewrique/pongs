import 'package:flutter/material.dart';
import 'package:pongs/app/widgets/search_input/search_input_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SearchInputWidget(),
    );
  }
}
