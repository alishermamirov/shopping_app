import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const routeName = "/product-details";
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Image.network(
            product.imageUrl,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
