import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_application/providers/product.dart';
import 'package:shop_application/screens/cart_screen.dart';
import 'package:shop_application/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  product.toggleFavorStatus();
                  },
              ),
              //child: Text('Never Changes!'),
            ),
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
