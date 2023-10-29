import 'package:flutter/material.dart';

class LoadingAnimationWidgetCustom extends StatefulWidget {
  final Color leftDotColor;
  final Color rightDotColor;
  final Color? leftBorderDotColor;
  final Color? rightBorderDotColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final double size;
  const LoadingAnimationWidgetCustom({
    Key? key,
    required this.leftDotColor,
    required this.rightDotColor,
    this.leftBorderDotColor,
    this.rightBorderDotColor,
    this.borderWidth,
    this.borderStyle,
    required this.size,
  }) : super(key: key);

  @override
  State<LoadingAnimationWidgetCustom> createState() =>
      _LoadingAnimationWidgetCustomState();
}

class _LoadingAnimationWidgetCustomState
    extends State<LoadingAnimationWidgetCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final Cubic curves = Curves.ease;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = widget.size;
    final Color leftDotColor = widget.leftDotColor;
    final Color rightDotColor = widget.rightDotColor;
    final Color? leftBorderDotColor = widget.leftBorderDotColor;
    final Color? rightBorderDotColor = widget.rightBorderDotColor;
    final double? borderWidth = widget.borderWidth;
    final BorderStyle? borderStyle = widget.borderStyle;

    return SizedBox(
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) => Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
              borderColor: leftBorderDotColor,
              borderWidth: borderWidth,
              borderStyle: borderStyle,
              initialOffset: Offset(-size / 3, 0),
              finalOffset: Offset(size / 3, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              controller: _animationController,
              visibility: _animationController.value <= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              borderColor: rightBorderDotColor,
              borderWidth: borderWidth,
              borderStyle: borderStyle,
              initialOffset: Offset(size / 3, 0),
              finalOffset: Offset(-size / 3, 0),
              interval: Interval(0.0, 0.5, curve: curves),
              visibility: _animationController.value <= 0.5,
              controller: _animationController,
            ),
            _BuildDot(
              size: size / 2,
              color: rightDotColor,
              borderColor: rightBorderDotColor,
              borderWidth: borderWidth,
              borderStyle: borderStyle,
              initialOffset: Offset(-size / 3, 0),
              finalOffset: Offset(size / 3, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
            _BuildDot(
              size: size / 2,
              color: leftDotColor,
              borderColor: leftBorderDotColor,
              borderWidth: borderWidth,
              borderStyle: borderStyle,
              initialOffset: Offset(size / 3, 0),
              finalOffset: Offset(-size / 3, 0),
              controller: _animationController,
              interval: Interval(0.5, 1.0, curve: curves),
              visibility: _animationController.value >= 0.5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _BuildDot extends StatelessWidget {
  final double size;
  final Color color;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final Offset initialOffset;
  final Offset finalOffset;
  final Interval interval;
  final bool visibility;
  final AnimationController controller;

  const _BuildDot({
    Key? key,
    required this.size,
    required this.color,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    required this.initialOffset,
    required this.finalOffset,
    required this.interval,
    required this.visibility,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Offset offsetAnimation = Tween<Offset>(
      begin: initialOffset,
      end: finalOffset,
    )
        .animate(
          CurvedAnimation(parent: controller, curve: interval),
        )
        .value;

    return Visibility(
      visible: visibility,
      child: Transform.translate(
        offset: offsetAnimation,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 0.0,
              style: borderStyle ?? BorderStyle.none,
            ),
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
