import 'package:flutter/material.dart';
import 'package:shop_application/providers/cart.dart';
import 'package:shop_application/providers/orders.dart';
import 'package:shop_application/screens/cart_screen.dart';
import 'package:shop_application/screens/orders_screen.dart';
import 'package:shop_application/screens/product_detail_screen.dart';
import 'package:shop_application/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/product_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
        value: Cart()
        ),
        ChangeNotifierProvider.value(
            value: Order()
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName : (ctx) => CartScreen(),
          OrderScreen.routeName : (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
