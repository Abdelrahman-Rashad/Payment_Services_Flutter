import 'package:flutter/material.dart';

import '../../../../Core/widgets/build_appbar.dart';
import '../components/successViewBody.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("", context),
      body: const SuccessViewBody(),
    );
  }
}
