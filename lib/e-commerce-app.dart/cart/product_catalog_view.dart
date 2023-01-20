import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/cart_controller.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/product_catalog_body.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/shopping_controller.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/user_cart_screen.dart';

class ProductsCatalog extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductsCatalog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products Catalog'),
  
          actions: [
            FloatingActionButton(onPressed: (){}),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 6.0),
                child: Badge(
                  toAnimate: false,
                 
                  child: const Icon(Icons.shopping_cart),
                  badgeContent: GetX<CartController>(
                    builder: ((controller) {
                      return Text(
                        controller.selectedProducts.length.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      );
                    }),
                  ),
                ),
              ),
              onTap: () {
                Get.to(const UserCartScreen());
              },
            )
          ],
        ),
        body:ProductCatalogBody()
         
        );
  }
}
