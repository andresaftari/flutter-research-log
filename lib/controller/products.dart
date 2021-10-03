import 'dart:math';

import 'package:get/get.dart';
import 'package:task_magang/model/item.dart';

class Products extends GetxController {
  RxList<Item> _items = List.generate(
    5,
    (index) => Item(
        id: index,
        name: 'Product $index',
        price: Random().nextDouble() * 100,
        inWishList: false.obs),
  ).obs;

  // Return all products
  List<Item> get items => [..._items];

  // Return the products that were added to wish list
  List<Item> get wishListItems {
    return _items.where((item) => item.inWishList.value == true).toList();
  }

  // Add an item to wishlist
  void addWishlist(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = true;
  }

  // Remove an item from wishlist
  void removeWishlist(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = false;
  }
}
