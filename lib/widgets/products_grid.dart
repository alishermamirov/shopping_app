import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/widgets/product_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final products=productData.list;
    return GridView.builder(
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
      );
  }
}