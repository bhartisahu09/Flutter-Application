import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/cart_controller.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final Stream<QuerySnapshot> userData =
      FirebaseFirestore.instance.collection('UserData').snapshots();

  late Razorpay razorpay;
  late var amt;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSucess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_iCKMWggJb2ysLV',
      'amount': amt * 100,
      'name': 'Payment',
      'description': 'You have to pay',
      'external': {
        'wallets': ['Paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handlerPaymentSucess() {
    debugPrint('Payment Succes');
  }

  void handlerError() {
    debugPrint('Payment Failed');
  }

  void handlerExternalWallet() {
    debugPrint('Payment Succes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 192, 93, 226),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Payment",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: GetBuilder<CartController>(
        builder: ((controller) {
          amt = controller.totalCost;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    'Are you Sure to pay',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                      child: Text(
                    '${controller.totalCost}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            openCheckout();
                          },
                          child: const Text('Proceed to pay'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(' Go Back')),
                      ],
                    ),
                  )
                ]),
          );
        }),
      ),
    );
  }
}
