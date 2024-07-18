import 'package:flutter/material.dart';


import 'package:shopping_app/widgets/products_grid.dart';

enum FiltersOption {
  All,
  Favorites,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shopping App"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == FiltersOption.All) {
                  _showOnlyFavorites = false;
                } else {
                  _showOnlyFavorites = true;
                }
              });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("Barchasi"),
                  value: FiltersOption.All,
                ),
                const PopupMenuItem(
                  child: Text("Sevimli"),
                  value: FiltersOption.Favorites,
                ),
              ];
            },
          )
        ],
      ),
      body: ProductsGrid(
        showOnlyFavorites: _showOnlyFavorites,
      ),
    );
  }
}
