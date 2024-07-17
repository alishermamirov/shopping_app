import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/widgets/product_grid_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Product> products = [
    Product(
      id: '1',
      title: 'Laptop',
      description: 'High performance laptop with 16GB RAM and 512GB SSD.',
      imageUrl:
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      price: 1200.00,
    ),
    Product(
      id: '2',
      title: 'Smartphone',
      description: 'Latest model smartphone with 5G connectivity.',
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      price: 800.00,
    ),
    Product(
      id: '3',
      title: 'Wireless Headphones',
      description:
          'Noise-cancelling wireless headphones with long battery life.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1683531060718-4dd0a8f2a692?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWlycG9kfGVufDB8fDB8fHww',
      price: 150.00,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping App"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductGridItem(product: product);
        },
      ),
    );
  }
}
