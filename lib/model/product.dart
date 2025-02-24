import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

part 'product.realm.dart';

@RealmModel()
class _Product {
  late String code;
  late String name;
  late int price;
  bool? isFav = false;
}

class Products extends ChangeNotifier {
  // late Realm realm;
  // late RealmResults<Product> products;

  // void initRealm() {
  //   var config = Configuration.local([Product.schema], schemaVersion: 2);
  //   realm = Realm(config);
  //   loadProducts();
  // }

  // void loadProducts() {
  //   products = realm.all<Product>();
  // }

  late List<Product> _products = [];
  List<Product> get products => _products;

  int get count => products.length;

  void addItem(Product p){
    products.add(p);
    notifyListeners();
  }
}
