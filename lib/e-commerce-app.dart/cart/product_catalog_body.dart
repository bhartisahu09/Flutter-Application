import 'package:flutter/material.dart';
import 'shopping_controller.dart';
import 'cart_controller.dart';
import 'package:get/get.dart';

class ProductCatalogBody extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductCatalogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GetX<ShoppingController>(
            builder: ((controller) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 10),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white70,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.network(
                            controller.products[index].imageUrl,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(controller.products[index].productName),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Rs.${controller.products[index].price.toString()}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.black26;
                                  }
                                  return Colors.white;
                                }),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            child: const Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.lightBlue,
                            ),
                            onPressed: () {
                              userCartController
                                  .addProductToCart(controller.products[index]);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            
            }
          ),
          ),
        ),);
  }
}
