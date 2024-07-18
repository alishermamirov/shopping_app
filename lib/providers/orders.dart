import 'package:flutter/material.dart';
import 'package:shopping_app/models/order.dart';

import '../models/cart_item.dart';

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  void addToOrders(double totalPrice, List<CartItem> products) {
    _items.insert(
      0,
      Order(
        id: UniqueKey().toString(),
        totalprice: totalPrice,
        date: DateTime.now(),
        products: products,
      ),
    );
    notifyListeners();
  }
}
