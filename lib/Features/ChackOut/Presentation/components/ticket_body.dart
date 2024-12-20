import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utiles/Styles.dart';

class TicketBody extends StatelessWidget {
  const TicketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65),
      child: Column(
        children: [
          const Text('Thank you!',
              textAlign: TextAlign.center, style: Styles.style25),
          const Text('Your transaction was successful',
              textAlign: TextAlign.center, style: Styles.style20),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ticket_info(
              textleft: 'Date',
              textright: '01/24/2023',
              textStyle: Styles.style18,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ticket_info(
              textleft: 'Time',
              textright: '10:15 AM',
              textStyle: Styles.style18,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ticket_info(
              textleft: 'To',
              textright: 'Sam Louis',
              textStyle: Styles.style18,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              color: Color(0xFFC6C6C6),
              height: 2,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const ticket_info(
              textleft: 'Total',
              textright: r'$50.97',
              textStyle: Styles.style25),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 305,
            height: 73,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/mastercard.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Credit Card       ",
                        style: Styles.style18,
                      ),
                      Text(
                        "Mastercard **78",
                        style: Styles.style16,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/images/QR.svg"),
              const Paid_button(),
            ],
          ),
        ],
      ),
    );
  }
}

class Paid_button extends StatelessWidget {
  const Paid_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 113,
      height: 58,
      child: Stack(
        children: [
          const Positioned(
            left: 29,
            top: 14,
            child: Text(
              'PAID',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF34A853),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 113,
              height: 58,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ticket_info extends StatelessWidget {
  const ticket_info(
      {super.key,
      required this.textleft,
      required this.textright,
      required this.textStyle});
  final String textleft;
  final String textright;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(textleft, textAlign: TextAlign.center, style: textStyle),
          const Spacer(),
          Text(textright, style: textStyle)
        ],
      ),
    );
  }
}
