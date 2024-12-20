import 'package:flutter/material.dart';
import '../../../../Core/utiles/Styles.dart';
import '../../../../Core/widgets/build_appbar.dart';
import '../../../../Core/widgets/custom_button.dart';
import '../components/MyCardViewBody.dart';
import '../components/OrderInfo.dart';
import '../components/payment_methods_sheet_provider.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("My Card", context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: SizedBox.expand(child: FittedBox(child: MyCardViewBody())),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox.expand(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderInfo(
                    order: "Order Subtotal",
                    price: r"$42.97",
                    style: Styles.style18,
                  ),
                  OrderInfo(
                    order: "Discount",
                    price: r"$0",
                    style: Styles.style18,
                  ),
                  OrderInfo(
                    order: "Shipping",
                    price: r"$8",
                    style: Styles.style18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: Divider(
                      color: Color(0xFFC6C6C6),
                    ),
                  )
                ],
              )),
            ),
            Expanded(
              flex: 1,
              child: SizedBox.expand(
                  child: Column(
                children: [
                  const OrderInfo(
                    order: "Total",
                    price: r"$50.97",
                    style: Styles.style24,
                  ),
                  CustomButton(
                    text: "Complete Payment",
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentPage()));
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) {
                            return const PaymentMethodsSheet();
                          });
                    },
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
