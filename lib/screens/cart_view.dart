import 'package:flutter/material.dart';

class cartView extends StatefulWidget {
  final List items;
  const cartView({super.key, required this.items});

  @override
  State<cartView> createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart View")),
      body: widget.items.isEmpty
          ? const Center(child: Text("Empty CartView"))
          : ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${widget.items[index]["Name"]}"),
                  subtitle: Text("${widget.items[index]["price"]}"),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.items.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete)),
                );
              }),
    );
  }
}
