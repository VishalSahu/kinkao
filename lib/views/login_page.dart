import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:kinkao/main.dart';
import 'package:kinkao/views/forget_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.showSignUpPage}) : super(key: key);

  final VoidCallback showSignUpPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
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
                    height: 30,
                  ),
                  //Google and Fb button
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),

                          //FB BUTTON
                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 50,
                              child: Container(
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xff203f7f),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xff3b5998),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Image.asset(
                                        "assets/icons/fb-icon.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Sign in with facebook",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          //Google BUTTON
                          GestureDetector(
                            onTap: signInViaGoogle,
                            child: SizedBox(
                              height: 50,
                              child: Container(
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xffbd2c1a),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: const Color(0xffdc4a38),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Image.asset(
                                        "assets/icons/gplus-icon.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Center(
                                      child: Text(
                                        "Sign in with Google+",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                color: Colors.green.withOpacity(0.5),
                                thickness: 2,
                              )),
                              const Text(
                                "  Or Use Email  ",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.green.withOpacity(0.5),
                                thickness: 2,
                              )),
                            ],
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailController.text)) {
                                return null;
                              } else if (value == null || value.isEmpty) {
                                return 'Please enter registered email ID';
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
                              prefixIcon: SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset(
                                  "assets/icons/email-icon.png",
                                  scale: 1.5,
                                ),
                              ),
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 8) {
                                return 'Password is not of 8 character';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                              hintText: 'Enter Password',
                              prefixIcon: SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset(
                                  "assets/icons/pass-icon.png",
                                  scale: 1.5,
                                ),
                              ),
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 55),

                              primary:
                                  const Color(0xffffc600), // Background color
                            ),
                            onPressed: emailLogIn,
                            child: const Text(
                              "LOGIN",
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgotPasswordPage();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(color: Colors.white),
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
                      "New User ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignUpPage,
                      child: const Text(
                        "Sign Up",
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

  Future emailLogIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${e.message}'),
      ));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future signInViaGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$e'),
      ));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
