import 'package:flutter/material.dart';
import 'package:products/provider/products.dart';
import 'package:products/widgtes/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavourites;

  const ProductsGrid({Key key, this.showFavourites}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Products>(context);
    final products =
        showFavourites ? providerData.favoriteItems : providerData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        );
      },
    );
  }
}
