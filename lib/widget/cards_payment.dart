import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageUrl;
  final VoidCallback? tapPayment;
  const Cards({super.key, this.title, this.description, this.imageUrl,this.tapPayment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 80,
        width: double.infinity,
        child: Center(
          child: ListTile(
            onTap: tapPayment,
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrl.toString()))),
              // backgroundImage: ,
            ),
            title: Text(title!),
            subtitle: Text(description!),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ),
    );
  }
}
