import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              width: 350.0,
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFCE86),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: TextFormField(
                autofocus: true,
                maxLines: 1,
                style: const TextStyle(
                    fontFamily: "Poppins", color: Color(0xFF611313)),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xFF611313)),
              )),
        ),
      ],
    );
  }
}
