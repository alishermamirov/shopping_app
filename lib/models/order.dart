import 'package:shopping_app/models/cart_item.dart';

class Order {
  final String id;
  final double totalprice;
  final DateTime date;
  final List<CartItem> products;

  Order({
    required this.id,
    required this.totalprice,
    required this.date,
    required this.products,
  });
}
