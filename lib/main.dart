import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/cart.dart';
import 'providers/products.dart';
import 'screens/home_screen.dart';
import 'screens/product_details_screen.dart';
import 'theme/shopping_app_theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData theme = ShoppingAppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider<Orders>(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
        initialRoute: HomeScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
