import 'package:enigma_shops/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: "Smartwatch Pro",
      price: 1299,
      discription:
          "Stay connected on the go with our advanced Smartwatch Pro. Features include health tracking, notifications, and a sleek design.",
      imagePath: 'assets/watch.jpeg',
    ),
    Product(
      name: "Wireless Earbuds Elite",
      price: 799,
      discription:
          "Enjoy crystal-clear audio with our Wireless Earbuds Elite. Comfortable fit, noise cancellation, and long ...",
      imagePath: 'assets/earbuds.jpeg',
    ),
    Product(
      name: "HD Camera Xtreme",
      price: 6999,
      discription:
          "Capture your adventures with our HD Action Camera Xtreme.durable, ...",
      imagePath: 'assets/camera.jpeg',
    ),
    Product(
      name: "Laptop Voyager Pro",
      price: 59999,
      discription:
          "Unleash productivity with the Laptop Voyager Pro. Powerful performance...",
      imagePath: 'assets/laptop.avif',
    ),
    Product(
      name: "VR Headset Immersion",
      price: 5999,
      discription:
          "Immerse yourself in a new reality with our Virtual Reality ...",
      imagePath: 'assets/vr.jpeg',
    ),
  ];
  //user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add iem to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item to cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
