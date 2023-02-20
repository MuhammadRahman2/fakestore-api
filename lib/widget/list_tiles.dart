import 'package:flutter/material.dart';

class ListTiles extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final num? rating;
  final num? counting;
  final num? price;
  final VoidCallback? onTaps;
  ListTiles(
      {super.key,
      this.imageUrl,
      this.title,
      this.rating,
      this.counting,
      this.price,
      this.onTaps});

  @override
  State<ListTiles> createState() => _ListTilesState();
}

class _ListTilesState extends State<ListTiles> {
  int selectItem = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTaps,
      child: Card(
        child: Container(
          decoration: BoxDecoration(),
          // margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 70,
                width: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        onError: (exception, stackTrace) =>
                            const Icon(Icons.error),
                        image: NetworkImage(widget.imageUrl.toString()))),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    widget.title!.substring(0, 18),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rating: ${widget.rating}'),
                      const SizedBox(
                        width: 10,
                      ),
                      // Text('Counting: $counting'),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Container(
                        child: Text('\$${widget.price.toString()}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // title:
            // subtitle:
            // trailing:
            selectItem == 0
                ? Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectItem = selectItem + 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.red, Colors.lightGreen]),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      // width: 90,
                      // height: 70,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (selectItem > 0) {
                                    setState(() {
                                      selectItem--;
                                    });
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove)),
                          Text(selectItem.toString()),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (selectItem > 0) {
                                    setState(() {
                                      selectItem++;
                                    });
                                  }
                                });
                              }, icon: const Icon(Icons.add)),
                          //
                        ],
                      ),
                    ),
                  )
            //     Text(snapshot.data![index].description.toString()),
          ]),
        ),
      ),
    );
    ;
  }
}
