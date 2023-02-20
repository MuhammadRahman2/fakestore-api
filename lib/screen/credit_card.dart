import 'package:flutter/material.dart';

import '../widget/container_button.dart';

class CreditCard extends StatelessWidget {
  final num? price;
  const CreditCard({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Price'),
            Text(
              '\$${price.toString()}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Card Number'),
            const SizedBox(height: 7),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Container(
                        margin: const EdgeInsets.all(5),
                        width: 60,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i0.wp.com/mobirank.pl/wp-content/uploads/2022/03/visa-mastercard-logo.png?resize=1110%2C668&ssl=1')))),
                    // filled: true,
                    // fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: '**** **** **** ****'),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Valid until'),
                        const SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Month / year',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('CVV'),
                        const SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: '***',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text('Card holder'),
            const SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: 'Your name and surname',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 25),
            const ContainerButton(
              width: double.infinity,
              height: 50,
              title: 'Proceed to Confirm',
            ),
          ],
        ),
      ),
    );
  }
}
