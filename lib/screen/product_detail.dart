import 'package:flutter/material.dart';
import 'package:product_api/screen/address_info.dart';
import '../widget/container_button.dart';
import 'payment.dart';

class ProductDetail extends StatelessWidget {
  final num? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? category;
  final num? price;
  const ProductDetail(
      {super.key,
      this.id,
      this.title,
      this.imageUrl,
      this.description,
      this.category,
      this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(title!.substring(0, 11)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 7,
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl.toString()))),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title.toString(),
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  description.toString(),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Category: $category',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      '\$$price',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  ContainerButton(
                      width: MediaQuery.of(context).size.width * 0.3,
                      title: 'Add Card',
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddressInfo(
                                      price: price,
                                    )),
                          ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
