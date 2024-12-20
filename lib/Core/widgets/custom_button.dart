import 'package:flutter/material.dart';

import '../../../../Core/utiles/Styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 350,
          height: 73,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 350,
                  height: 73,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF34A853),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(text,
                    textAlign: TextAlign.center, style: Styles.style22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
