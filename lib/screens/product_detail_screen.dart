import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/provider/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key key}) : super(key: key);

  static final String routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),

      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.asset(loadedProduct.imageUrl, fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text('\$${loadedProduct.price}', textAlign: TextAlign.center ,style: TextStyle(fontSize: 20.0,
              color: Colors.grey),),
          SizedBox(height: 10,),
          Text(loadedProduct.description,textAlign: TextAlign.center, softWrap: true,),
        ],
      )
    );
  }
}
