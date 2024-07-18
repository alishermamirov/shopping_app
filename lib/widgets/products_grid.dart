// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/widgets/product_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  const ProductsGrid({
    Key? key,
    required this.showOnlyFavorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final productData = Provider.of<Products>(context);
    final products =
        showOnlyFavorites ? productData.favorites : productData.list;
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<Product>.value(
          value: products[index],
          child: const ProductGridItem(),
        );
      },
    );
  }
}
