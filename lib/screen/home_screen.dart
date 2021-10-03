import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_magang/controller/products.dart';
import 'package:task_magang/screen/wishlist_screen.dart';

class HomeScreen extends StatelessWidget {
  final Products _product = Get.put(Products());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Demo GetX')),
        body: Column(
          children: [
            SizedBox(height: 20),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishListScreen()),
              ),
              child: Container(
                width: 300,
                height: 80,
                color: Colors.red,
                alignment: Alignment.center,
                child: Obx(
                  () => Text(
                    'Wishlist : ${_product.wishListItems.length}',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _product.items.length,
                itemBuilder: (context, index) {
                  final product = _product.items[index];

                  return Card(
                    key: ValueKey(product.id),
                    margin: EdgeInsets.all(5.0),
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),

                      // Use Obx(()=> to update icon color when product.inWishList
                      trailing: Obx(
                        () => IconButton(
                          onPressed: () {
                            if (product.inWishList.value == false) {
                              _product.addWishlist(product.id);
                            } else
                              _product.removeWishlist(product.id);
                          },
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: product.inWishList.value == false
                                ? Colors.white
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
