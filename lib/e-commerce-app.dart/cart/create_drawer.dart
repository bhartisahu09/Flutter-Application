import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/about_us.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/product_catalog_body.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/user_cart_screen.dart';
import '../login/sign_in.dart';
import 'shopping_controller.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class ProductsCatalogHome extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductsCatalogHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 192, 93, 226),
          elevation: 2,
          title: const Text(
            'Novels',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 6.0),
                child: Badge(
                  toAnimate: false,
                  badgeContent: GetX<CartController>(
                    builder: ((controller) {
                      return Text(
                        controller.selectedProducts.length.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      );
                    }),
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
              onTap: () {
                Get.to(UserCartScreen());
              },
            )
          ],
          
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () {
                  Get.to(ProductsCatalogHome());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text('Go to Cart'),
                onTap: () {
                  Get.to(UserCartScreen());
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('About Us'),
                onTap: () {
                 Get.to(AboutUs());
                },
              ),
              ListTile(
                onTap: () async {
                  FirebaseAuth.instance.signOut();
                  Get.to(SignInScreen());
                },
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Log out"),
              )
            ],
          ),
        ),
        body: ProductCatalogBody());
  }
}
