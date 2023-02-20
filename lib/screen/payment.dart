import 'package:flutter/material.dart';
import 'package:product_api/screen/credit_card.dart';
import 'package:product_api/screen/phone_code.dart';
import 'package:product_api/widget/cards_payment.dart';
import '../widget/container_button.dart';

class Payment extends StatelessWidget {
  final num? price;
  Payment({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          Cards(
            tapPayment: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) =>  CreditCard(price: price)));
            },
            title: 'Credit Card',
            description: 'Pay with visa or MasterCard',
            imageUrl:
                'https://i0.wp.com/mobirank.pl/wp-content/uploads/2022/03/visa-mastercard-logo.png?resize=1110%2C668&ssl=1',
          ),
          const SizedBox(
            height: 10,
          ),
          Cards(
            tapPayment: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PhoneCode()));
            },
            title: 'Bank Transfer',
            description: 'Pay with ATM or Internet Bank',
            imageUrl:
                'https://photo-cdn2.icons8.com/QV_gmSuM6qDtupb31gnM-iIsB0uCAsQDP2vR1jfKLYg/rs:fit:1606:1072/wm:1:re:0:0:0.65/wmid:moose/q:98/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvNjc2L2Q1NDJi/Mjc0LWVmMmUtNGFk/Ny04NWIxLTllOWJj/YjY3NTVhMC5qcGc.jpg',
          )
        ],
      ),
    );
  }
}
