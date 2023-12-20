// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:enigma_shops/componets/my_buttons.dart';
import 'package:enigma_shops/models/product.dart';
import 'package:enigma_shops/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item to the art?"),
        actions: [
          //cancle button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancle!"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("👍"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        //cart list
        Expanded(
          child: cart.isEmpty
              ? const Center(child: Text("Your cart is empty.."))
              : ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    //get individual item in cart
                    final item = cart[index];

                    //return as a cart tile UI
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('₹ ' + item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  },
                ),
        ),

        //pay button
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(
              onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
        )
      ]),
    );
  }
}
