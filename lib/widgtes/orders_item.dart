import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../provider/orders.dart' as orders;
import 'dart:math';

class OrdersItem extends StatefulWidget {
  final orders.OrderItem order;

  const OrdersItem({Key key, this.order}) : super(key: key);

  @override
  _OrdersItemState createState() => _OrdersItemState();
}

class _OrdersItemState extends State<OrdersItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (!_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 10, 150),
              child: ListView.builder(
                itemCount: widget.order.products.length,
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.order.products[index].title}'),
                    Spacer(),
                    Text('${widget.order.products[index].quantity}X '),
                    Text(
                        '\$${widget.order.products[index].price
                            * widget.order.products[index].quantity}')
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
