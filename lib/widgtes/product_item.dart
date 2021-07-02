import 'package:flutter/material.dart';
import 'package:products/provider/cart.dart';
import 'package:products/provider/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    print('Rebuilt...');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/product-detail',
              arguments: product.id,
            );
          },
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Consumer<Product>(
              builder: (ctx, product, child) => Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          title: Text(product.title),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              cart.addItem(
                productId: product.id,
                price: product.price,
                title: product.title,
              );
            },
          ),
        ),
      ),
    );
  }
}
