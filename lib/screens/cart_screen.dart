import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/providers/cart.dart' show Cart;
import 'package:shop_application/providers/orders.dart';
import 'package:shop_application/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  //SizedBox(width: 10,),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.subtitle1!.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColorLight,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                      cart.clearCart();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => CartItem(
                cart.items.values.toList()[index].id,
                cart.items.values.toList()[index].price,
                cart.items.values.toList()[index].quantity,
                cart.items.values.toList()[index].title,
                cart.items.keys.toList()[index]),
            itemCount: cart.itemCount,
          )),
        ],
      ),
    );
  }
}
