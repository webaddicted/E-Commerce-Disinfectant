import 'package:flutter/material.dart';
import 'package:rallis/utils/constant/color_const.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? ColorConst.appColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}