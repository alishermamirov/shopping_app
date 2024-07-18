// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed(ProductDetailsScreen.routeName, arguments: product.id),
          // child: Image.network(
          //   product.imageUrl,
          //   fit: BoxFit.cover,
          // ),
          child: CachedNetworkImage(
            imageUrl: product.imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              color: Colors.grey.withOpacity(0.2),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.8),
          leading: Consumer<Product>(
            builder: (context, prod, child) => IconButton(
              onPressed: () => prod.toggleFavorite(),
              icon: Icon(
                prod.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addToCart(
                product.id,
                product.title,
                product.price,
                product.imageUrl,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ),
      ),
    );
  }
}
