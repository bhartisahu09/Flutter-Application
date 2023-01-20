import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_flutter_application/e-commerce-app.dart/cart/create_drawer.dart';
import 'package:new_flutter_application/e-commerce-app.dart/login/reset_password.dart';
import 'package:new_flutter_application/e-commerce-app.dart/login/sign_up.dart';
import 'package:new_flutter_application/reusable_widgets/reusable.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.2,
                20,
                100,
              ),
              child: Column(
                children: [
                  logoWidget("assets/images/logo4.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Email ID", Icons.mail_outline, false,
                      emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter Password', Icons.lock, true,
                      passwordTextController),
                  const SizedBox(
                    height: 8,
                  ),
                  forgetPassword(context),
                  signInSignUpButton(context, "LOGIN", () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailTextController.text,
                                password: passwordTextController.text)
                            .then((value) {
                          Get.to(ProductsCatalogHome());
                          FirebaseFirestore.instance
                              .collection('UserData')
                              .doc(value.user?.email)
                              .set({'email': value.user?.email});
                        }).onError((error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color.fromARGB(255, 245, 92, 92),
                              content: Text('$error')));
                        });
                      }
                    });
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          " Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ResetPasswordScreen())),
      ),
    );
  }
}
