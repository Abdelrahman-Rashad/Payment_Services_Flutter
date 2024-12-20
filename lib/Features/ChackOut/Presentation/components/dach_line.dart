import 'package:flutter/material.dart';

class dash_line extends StatelessWidget {
  const dash_line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.2 + 20,
      left: 25,
      right: 25,
      child: Row(
          children: List.generate(
              20,
              (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Container(
                        height: 2,
                        color: const Color(0xFFB8B8B8),
                      ),
                    ),
                  ))),
    );
  }
}
