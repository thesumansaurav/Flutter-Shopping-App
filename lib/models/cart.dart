import 'package:myapp/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel()=> cartModel;


  late CatalogModel _catalog;

  final List<String> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;

  }
  // get item in the cart

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalPrice => items.fold(0, (total, item) => total + item.price);

  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item){
   _itemIds.remove(item.id);
  }
}