import 'package:flutter/material.dart';
import 'package:payment_service/Features/ChackOut/Presentation/components/check_icon.dart';
import 'package:payment_service/Features/ChackOut/Presentation/components/dach_line.dart';
import 'package:payment_service/Features/ChackOut/Presentation/components/ticket_body.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: ShapeDecoration(
              color: const Color(0xFFEDEDED),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * 0.2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Check_Icon(),
          const dash_line(),
          const TicketBody()
        ],
      ),
    );
  }
}
