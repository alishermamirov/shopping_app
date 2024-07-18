// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final int quantity;
  const CartListItem({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        title: Text("$title  (x$quantity)"),
        subtitle: Text("Umumiy: \$${(quantity * price).toStringAsFixed(2)}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
            ),
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
              child: Text(
                quantity.toString(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
