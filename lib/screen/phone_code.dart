import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widget/container_button.dart';

class PhoneCode extends StatelessWidget {
  const PhoneCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                decoration: InputDecoration(
                    hintText: '+92301 12345677',
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const ContainerButton(
              title: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
