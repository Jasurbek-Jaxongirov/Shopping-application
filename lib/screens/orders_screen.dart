import 'package:flutter/material.dart';
import 'package:products/provider/orders.dart' show Orders;
import 'package:provider/provider.dart';
import '../widgtes/orders_item.dart';
import '../widgtes/app_drawer.dart';
class OrdersScreen extends StatelessWidget {
  static String routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (context, index) =>
            OrdersItem(order: ordersData.orders[index]),
      ),
    );
  }
}
