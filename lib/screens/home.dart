import 'package:addcart/data/product_list.dart';
import 'package:addcart/screens/cart_view.dart';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List cartItem = [];
  List favItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Stack(children: [
              IconButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => cartView(
                                  items: cartItem,
                                )));
                    setState(() {});
                  },
                  icon: const Icon(Icons.shopping_cart)),
              const Positioned(
                right: 6,
                bottom: 29,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.red,
                ),
              ),
              Positioned(
                  right: 8,
                  bottom: 29,
                  child: Text(
                    cartItem.length.toString(),
                  )),
            ]),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 3),
              child: ListTile(
                tileColor: Colors.grey,
                title: Text(
                  productData[index]["Name"],
                ),
                subtitle: Text(
                  productData[index]["price"].toString(),
                ),
                trailing: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (productData[index]["isFav"] == true) {
                              productData[index]["isFav"] = false;
                              favItem.remove(productData[index]);
                            } else {
                              productData[index]["isFav"] = true;
                              favItem.add(productData[index]);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: productData[index]["isFav"] == true
                              ? Colors.red
                              : Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            cartItem.add(productData[index]);
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
