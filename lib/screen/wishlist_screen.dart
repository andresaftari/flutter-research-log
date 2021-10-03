import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_magang/controller/products.dart';

class WishListScreen extends StatelessWidget {
  final Products _product = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WishList')),
      body: Obx(() => ListView.builder(
            itemCount: _product.wishListItems.length,
            itemBuilder: (context, index) {
              final item = _product.wishListItems[index];

              return Card(
                key: ValueKey(item.id),
                margin: EdgeInsets.all(5.0),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),

                  // Button use to remove the item from wish list
                  trailing: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      item.inWishList.value = false;
                      _product.removeWishlist(item.id);
                    },
                  ),
                ),
              );
            },
          )),
    );
  }
}
