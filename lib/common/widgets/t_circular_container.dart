import 'package:flutter/material.dart';
import 'package:velik/utils/constants/colors.dart';

class TCircularContainer extends StatefulWidget {
  const TCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.margin,
      this.backgroundColor = TColors.white,
      this.child});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  State<TCircularContainer> createState() => _TCircularContainerState();
}

class _TCircularContainerState extends State<TCircularContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.backgroundColor,
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }
}
