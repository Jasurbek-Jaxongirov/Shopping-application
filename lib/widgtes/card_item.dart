import 'package:flutter/material.dart';
import 'package:products/provider/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key, this.id, this.price, this.productId, this.quantity, this.title})
      : super(key: key);

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        child: ListTile(
          leading: Text('\$$price'),
          title: Text('$title'),
          subtitle: Text('Total \$${(quantity * price).toStringAsFixed(2)}'),
          trailing: Text('${quantity}X'),
        ),
      ),
    );
  }
}
