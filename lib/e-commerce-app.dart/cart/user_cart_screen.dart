import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/cart_controller.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/payment.dart';
import 'package:new_flutter_application/reusable_widgets/reusable.dart';

class UserCartScreen extends StatelessWidget {
  const UserCartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text('User Cart'),
        ),
        body: ListView(
            children: [
              GetBuilder<CartController>(
                builder: ((controller) {
                  return Column(children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                          itemCount: controller.selectedProducts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              minVerticalPadding: 5,
                              leading: Image.network(
                                  controller.selectedProducts[index].imageUrl),
                              title: Text(controller
                                  .selectedProducts[index].productName),
                              subtitle: Text(controller
                                  .selectedProducts[index].price
                                  .toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        controller
                                            .decreaseQuantityProduct(index);
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color: Colors.black,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(controller
                                      .selectedProducts[index].quantity
                                      .toString()),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        controller
                                            .increaseQuantityProduct(index);
                                      },
                                      child: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.black,
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return Colors.black26;
                                            }
                                            return Colors.white;
                                          }),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)))),
                                      onPressed: () {
                                        controller.removeProductsFromCart(
                                            controller.selectedProducts[index]);
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total Price : Rs. ${controller.totalCost}',
                      style: const TextStyle(fontSize: 30.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    signInSignUpButton(context, 'Proceed to Payment', 
                    (
                    ) {
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                    }),
                    
                  ]);
                }),
              ),
            ]));
  }
}
