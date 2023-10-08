import 'package:flutter/material.dart';

class ButtonLargeCustom extends StatefulWidget {
  final String buttonName;
  const ButtonLargeCustom({super.key, required this.buttonName});

  @override
  State<ButtonLargeCustom> createState() => _ButtonLargeCustomState();
}

class _ButtonLargeCustomState extends State<ButtonLargeCustom> {
  dynamic _widthButton;

  @override
  void didChangeDependencies() {
    _widthButton = MediaQuery.of(context).size.width * 0.65;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 8.0),
      child: SizedBox(
        width: _widthButton,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF611313),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          child: Text(
            widget.buttonName,
            style: const TextStyle(
                fontFamily: "Poppins",
                color: Color(0xFFFFCE86),
                fontWeight: FontWeight.w700,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
