import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomPaymentMethod extends StatelessWidget {
  CustomPaymentMethod(
      {super.key, required this.isActive, required this.imageName});
  bool isActive = false;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.50,
              color: isActive ? const Color(0xFF34A853) : Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xFF34A853) : Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SvgPicture.asset(
            imageName,
            height: 25,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
