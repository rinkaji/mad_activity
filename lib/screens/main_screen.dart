import 'package:activity/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class MainScreen extends StatelessWidget {
  var codeCtrl = TextEditingController();

  var nameCtrl = TextEditingController();

  var priceCtrl = TextEditingController();

  late Realm realm;
  late RealmResults<Product> items;
  void initRealm() {
    var config = Configuration.local([Product.schema], schemaVersion: 2);
    realm = Realm(config);
    loadProducts();
  }

  void loadProducts() {
    items = realm.all<Product>();
  }

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initRealm();
    return Consumer<Products>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text("View Products"),
              actions: [
                IconButton(onPressed: null, icon: Icon(Icons.shopping_cart)),
                IconButton(
                  onPressed: () => addProduct(context),
                  icon: Icon(Icons.add),
                ),
                IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
              ],
            ),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                var myItem = items[index];
                return Card(
                  child: ListTile(
                    title: Text(myItem.name),
                    subtitle: Text(myItem.price.toString()),
                    leading:
                        myItem.isFav == false
                            ? Icon(Icons.favorite_border_outlined)
                            : Icon(Icons.favorite),
                    trailing: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
                );
              },
            ),
          ),
    );
  }

  addProduct(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Add product"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: codeCtrl),
              TextField(controller: nameCtrl),
              TextField(controller: priceCtrl),
            ],
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text("cancel"),
            ),
            ElevatedButton(onPressed: () => add(context), child: Text("add")),
          ],
        );
      },
    );
  }

  void add(BuildContext context) {
    var p = Product(codeCtrl.text, nameCtrl.text, int.parse(priceCtrl.text));
    Provider.of<Products>(context, listen: false).addItem(p);
    realm.write(() {
      realm.add(
        Product(codeCtrl.text, nameCtrl.text, int.parse(priceCtrl.text)),
      );
      print("item added");
    });
  }
}
