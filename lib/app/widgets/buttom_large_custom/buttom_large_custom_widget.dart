import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLargeCustomWidget extends StatefulWidget {
  final String buttonName;
  final VoidCallback? onPressed;
  final double customPaddingTop;
  final double customPaddingLeft;
  final double customPaddingRight;
  final double customPaddingBottom;
  final double customFontSize;
  final Color customColorTitle;
  final Color customBackgroundColor;

  const ButtonLargeCustomWidget({
    Key? key,
    required this.buttonName,
    this.onPressed,
    this.customPaddingLeft = 0.0,
    this.customPaddingTop = 4.0,
    this.customPaddingRight = 0.0,
    this.customPaddingBottom = 8.0,
    this.customFontSize = 20,
    this.customColorTitle = const Color(0xFF611313),
    this.customBackgroundColor = const Color(0xFFFFCE86),
  }) : super(key: key);

  @override
  State<ButtonLargeCustomWidget> createState() =>
      _ButtonLargeCustomWidgetState();
}

class _ButtonLargeCustomWidgetState extends State<ButtonLargeCustomWidget> {
  dynamic _widthButton;

  @override
  void didChangeDependencies() {
    _widthButton = MediaQuery.of(context).size.width * 0.65;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.customPaddingLeft,
        widget.customPaddingTop,
        widget.customPaddingRight,
        widget.customPaddingBottom,
      ),
      child: SizedBox(
        width: _widthButton,
        height: 50,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.customColorTitle,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          child: Text(
            widget.buttonName,
            style: GoogleFonts.getFont(
              "Poppins",
              color: widget.customBackgroundColor,
              fontWeight: FontWeight.w700,
              fontSize: widget.customFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
