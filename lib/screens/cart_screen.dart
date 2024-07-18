import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = "/cart-screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Savatcha"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Umumiy:",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const Spacer(),
                    Chip(
                      label: Text(
                        "\$${cart.totalPrice().toStringAsFixed(2)} ",
                        style: const TextStyle(
                          // fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Buyurtma qilish",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: cart.items.isEmpty
                    ? Center(
                        child: Text(
                          "Savatcha bo'sh",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final cartItem = cart.items.values.toList()[index];
                          return CartListItem(
                            id: cart.items.keys.toList()[index],
                            image: cartItem.image,
                            title: cartItem.title,
                            price: cartItem.price,
                            quantity: cartItem.quantity,
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }
}
