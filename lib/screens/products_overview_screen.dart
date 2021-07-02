import 'package:flutter/material.dart';
import 'package:products/provider/cart.dart';
import 'package:products/screens/cart_screen.dart';
import 'package:products/widgtes/app_drawer.dart';
import 'package:products/widgtes/badge.dart';
import 'package:products/widgtes/products_grid.dart';
import 'package:provider/provider.dart';

enum FavoriteOptions {
  FavoritesOnly,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key key}) : super(key: key);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavouriteItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FavoriteOptions selectedValue) {
              setState(() {
                if (selectedValue == FavoriteOptions.FavoritesOnly) {
                  _showFavouriteItems = true;
                } else {
                  _showFavouriteItems = false;
                }
                print(_showFavouriteItems);
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FavoriteOptions.FavoritesOnly,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FavoriteOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(showFavourites: _showFavouriteItems),
    );
  }
}
