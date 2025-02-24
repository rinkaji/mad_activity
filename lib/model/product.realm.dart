// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Product extends _Product with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Product(
    String code,
    String name,
    int price, {
    bool? isFav = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Product>({
        'isFav': false,
      });
    }
    RealmObjectBase.set(this, 'code', code);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'isFav', isFav);
  }

  Product._();

  @override
  String get code => RealmObjectBase.get<String>(this, 'code') as String;
  @override
  set code(String value) => RealmObjectBase.set(this, 'code', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => RealmObjectBase.set(this, 'price', value);

  @override
  bool? get isFav => RealmObjectBase.get<bool>(this, 'isFav') as bool?;
  @override
  set isFav(bool? value) => RealmObjectBase.set(this, 'isFav', value);

  @override
  Stream<RealmObjectChanges<Product>> get changes =>
      RealmObjectBase.getChanges<Product>(this);

  @override
  Stream<RealmObjectChanges<Product>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Product>(this, keyPaths);

  @override
  Product freeze() => RealmObjectBase.freezeObject<Product>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'code': code.toEJson(),
      'name': name.toEJson(),
      'price': price.toEJson(),
      'isFav': isFav.toEJson(),
    };
  }

  static EJsonValue _toEJson(Product value) => value.toEJson();
  static Product _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'code': EJsonValue code,
        'name': EJsonValue name,
        'price': EJsonValue price,
      } =>
        Product(
          fromEJson(code),
          fromEJson(name),
          fromEJson(price),
          isFav: fromEJson(ejson['isFav'], defaultValue: false),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(Product._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, Product, 'Product', [
      SchemaProperty('code', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('isFav', RealmPropertyType.bool, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
