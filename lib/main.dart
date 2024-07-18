import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/products.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/product_details_screen.dart';
import 'package:shopping_app/theme/shopping_app_theme.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
