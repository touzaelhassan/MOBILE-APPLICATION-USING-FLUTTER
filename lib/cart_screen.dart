import 'package:flutter/material.dart';

import 'item_sreen.dart';

class CartScreen extends StatelessWidget {
  final List<Item> items;

  CartScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in items) {
      total += item.price * item.quantity;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(items[index].name),
                      Spacer(),
                      Text('\$${items[index].price.toStringAsFixed(2)}'),
                      SizedBox(width: 8),
                      Text('x ${items[index].quantity}'),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Total: \$${total.toStringAsFixed(2)}'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement checkout logic
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
