import 'package:flutter/material.dart';

class Check_Icon extends StatelessWidget {
  const Check_Icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      top: -50,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xFFD9D9D9),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xFF34A853),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
