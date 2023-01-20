import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../reusable_widgets/reusable.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter UserName', Icons.person, false,
                      userNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField(
                      'Enter Email Id', Icons.email, false, emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField('Enter Password', 
                  Icons.lock, true,
                      passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, "SIGN UP", () {
                    setState(() {
                      if(_formKey.currentState!.validate()){
                 final credential=FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text)
                        .then((value) {
                      debugPrint("Account created Successfully");
                       Navigator.pop(context);
                        }).catchError((onError){    
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text('$onError')));
                      });}
                    });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


