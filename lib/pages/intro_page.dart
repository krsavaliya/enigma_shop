// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:enigma_shops/componets/my_buttons.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //title
            Text('Enigma Shops',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),

            const SizedBox(height: 10),

            //subtitle
            Text(
              "Primium Quality Products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
