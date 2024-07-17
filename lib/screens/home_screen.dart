import 'package:flutter/material.dart';

import 'package:shopping_app/widgets/products_grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping App"),
      ),
      body: ProductsGrid()
    );
  }
}
