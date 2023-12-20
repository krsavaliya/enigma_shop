// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:enigma_shops/models/product.dart';
import 'package:enigma_shops/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
    //show dialoge box to add to crart or not
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to the art?"),
        actions: [
          //cancle button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancle!"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),
          //product name
          Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 10),
          //product discription
          Text(
            product.discription,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),
          //product price + ad to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price of the product
              Text("₹ " + product.price.toStringAsFixed(2)),

              //add to cart button
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
