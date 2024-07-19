import 'package:flutter/material.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/screens/manage_product_screen.dart';
import 'package:shopping_app/screens/orders_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: Text("Menyu"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            title: Text("Do'kon"),
            leading: Icon(Icons.shop),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(HomeScreen.routeName),
          ),
          ListTile(
            title: Text("Buyurtmalar"),
            leading: Icon(Icons.shopify),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routeName),
          ),
          ListTile(
            title: Text("Mahsulatlarni boshqarish"),
            leading: Icon(Icons.manage_search),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(ManageProductScreen.routeName),
          ),
        ],
      ),
    );
  }
}
