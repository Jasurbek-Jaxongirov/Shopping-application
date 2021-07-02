import 'package:flutter/material.dart';
import 'package:products/provider/cart.dart' show Cart;
import 'package:products/provider/orders.dart';
import 'package:products/widgtes/card_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);
  static String routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Card(
        margin: EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrders(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },

                    child: Text(
                      'ORDER NOW!',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (_, i) => CartItem(
                  id: cart.items.values.toList()[i].id,
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  title: cart.items.values.toList()[i].title,
                  productId: cart.items.keys.toList()[i],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
