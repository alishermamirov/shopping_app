import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  const UserProductItem({super.key});

  void showDeleteProduct(BuildContext context,
      {required Function deletingFunction}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("O'chirilmoqda"),
          content: Text("Ushbu mahsulot o'chilirmoqda"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Bekor qilish"),
            ),
            ElevatedButton(
              onPressed: () {
                deletingFunction();
                Navigator.pop(context);
              },
              child: const Text("O'chirish"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        title: Text(product.title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: product.id),
              icon: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () => showDeleteProduct(context,
                  deletingFunction: () =>
                      Provider.of<Products>(context, listen: false)
                          .deleteProduct(product.id)),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
