import 'package:flutter/material.dart';
import 'package:product_api/api/api_product.dart';
import 'package:product_api/screen/product_detail.dart';
import '../widget/list_tiles.dart';
import 'add_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectItme = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const AddData()));
              },
              icon: const Icon(
                Icons.add,
                size: 35,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: ApiProduct().getProductApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data![index];
                    return ListTiles(
                      onTaps: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetail(
                              id: data.id,
                              title: data.title,
                              imageUrl: data.image,
                              description: data.description,
                              price: data.price,
                              category: data.category,
                            ),
                          ),
                        );
                      },
                      imageUrl: data.image,
                      title: data.title,
                      rating: data.rating!.rate,
                      counting: data.rating!.count,
                      price: data.price,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
