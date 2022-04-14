import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/providers/orders.dart' show Order;
import 'package:shop_application/widgets/app_drawer.dart';
import 'package:shop_application/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
      itemCount: orderData.orders.length),
    );
  }
}
