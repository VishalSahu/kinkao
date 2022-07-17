import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinkao/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  final VoidCallback showLoginPage;
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _fullAddressController = TextEditingController();
  final _mobileNoController = TextEditingController();

  String checkIcon = "check-box-black.png";
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _fullAddressController.dispose();
    _passwordController.dispose();
    _mobileNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter?.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Logo
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Center(
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Google and Fb button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailController.text)) {
                                return null;
                              } else if (value == null || value.isEmpty) {
                                return 'Please enter email ID';
                              } else {
                                return 'Please enter proper email ID';
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Enter Emaill ID',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter new password';
                              } else if (value.length < 8) {
                                return 'Password is not of 8 character';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: true,
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Set Password',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _fullNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full name';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Full Name',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _fullAddressController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter full address';
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Full Address',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _mobileNoController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter mobile number';
                              } else if (RegExp(
                                          r"^(\[\-\s]?)?[0]?(91)?[789]\d{9}$")
                                      .hasMatch(_mobileNoController.text) &&
                                  value.length == 10) {
                                return null;
                              } else {
                                return "Please enter proper mobile number.";
                              }
                            },
                            style: const TextStyle(
                                fontSize: 18.0, color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: signUp,
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 55),
                              primary:
                                  const Color(0xffffc600), // Background color
                            ),
                            child: const Text(
                              "CREATE ACCOUNT",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                checkIcon = "Registration.png";
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: Image.asset(
                                    "assets/icons/$checkIcon",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const Text(
                                  " I've Read & Accept term and condition",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //FOOTER SECTIONS
              Container(
                height: 60,
                width: double.maxFinite,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      User? user = FirebaseAuth.instance.currentUser;
      addUserDetails(
        user!.uid,
        _fullNameController.text.trim(),
        _emailController.text.trim(),
        _fullAddressController.text.trim(),
        _mobileNoController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${e.message}'),
      ));
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future addUserDetails(String userId, String name, String email,
      String address, String phone) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'Name': name,
      'Email': email,
      'Address': address,
      'Phone_No': phone,
    });
  }
}
