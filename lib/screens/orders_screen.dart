import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/widgets/main_drawer.dart';
import 'package:shopping_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Buyurtmalar"),
      ),
      body: ListView.builder(
        itemCount: orders.items.length,
        itemBuilder: (context, index) {
          final order = orders.items[index];
          return OrderItem(order: order);
        },
      ),
    );
  }
}
