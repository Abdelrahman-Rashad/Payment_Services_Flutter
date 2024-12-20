import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utiles/Styles.dart';

AppBar buildAppbar(final String title, BuildContext context) {
  return AppBar(
    leading: Center(
        child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset("assets/images/arrow.svg"))),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title, textAlign: TextAlign.center, style: Styles.style25),
  );
}
