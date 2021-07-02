import 'package:flutter/cupertino.dart';
import 'package:products/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'acer',
        title: 'Acer Laptop',
        description:
            'Acer Aspire is a Windows 10 laptop with a 15.60-inch display '
            'that has a resolution of 1920x1080 pixels. It is powered by'
            'a Core i7 processor and it comes with 8GB of RAM. The Acer Aspire'
            'packs 1TB of HDD storage. Graphics are powered by Intel HD Graphics 620.',
        price: 700.0,
        imageUrl: 'assets/images/laptop.jpg'),
    Product(
        id: 'dress-shoes',
        title: 'Dress Shoes',
        description: 'Dress shoes are worn by many as their standard daily'
            ' shoes, and are widely used in dance, for parties, and for special occasions.',
        price: 55.0,
        imageUrl: 'assets/images/dress-shoes.jfif'),
    Product(
        id: 'television-hisense',
        title: 'Hisense Television',
        description:
            'Hisense TVs have a reputation for being high-tech and high quality.'
            ' Hisense TVs come in several varieties: laser TVs, 4K ULED TVs, 4K UHD TVs and HDTVs',
        price: 1500.0,
        imageUrl: 'assets/images/hisense.jpg'),
    Product(
        id: 'television-skyrun',
        title: 'Skyrun Television',
        description:
            'Skyrun TVs display Cinematic Colour with a colour palette that virtually matches those seen in today\'s'
            ' high-end digital cinemas. Now the home theatre experience is on a par with real theatres',
        price: 750.0,
        imageUrl: 'assets/images/skyrun-television.jfif'),
    Product(
        id: 't-shirt',
        title: 'T-Shirt',
        description:
            'A T-shirt, or tee shirt, is a style of fabric shirt named after the T shape'
            'of its body and sleeves. Traditionally, it has short sleeves and a round neckline,'
            ' known as a crew neck, which lacks a collar.',
        price: 55.0,
        imageUrl: 'assets/images/t-shirt.jpg'),
    Product(
        id: 'sports-shoe',
        title: 'Sports Shoe',
        description:
            ' Extremely lightweight material, these are nice shoes for everyday'
            ' use, or wedding .this unique design and stylish shoes are to maximize your fashion',
        price: 75.0,
        imageUrl: 'assets/images/sports-shoe.jfif'),
  ];

  List<Product> get items {
    return [...?_items];
  }

  List<Product> get favoriteItems {
    return _items.where((productItem) => productItem.isFavorite).toList();
  }

  Product findById(String id) => _items.firstWhere((item) => item.id == id);

  void addItem() {
    // ignore: todo
    // TODO: Add Items to _item
    notifyListeners();
  }
}
