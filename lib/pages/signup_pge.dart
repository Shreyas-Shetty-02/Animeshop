// ignore: depend_on_referenced_packages

import 'package:animeshop/pages/home_page.dart';
import 'package:animeshop/pages/login_page.dart';
import 'package:animeshop/utlis/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _SignupState extends State<Signup> {
  bool changeButton = false;
  // final _formkey = GlobalKey<FormState>();

  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _confirmpasswordController =
  //     TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  Future<bool> signup() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: AlertDialog(title: Text("Account is already in use"))));
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Email Invalid")));
      } else if (e.code == "weak-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Weak Password")));
      }
      return Future(() => false);
    }
    var db = FirebaseFirestore.instance;
    var userData = {
      "email": _emailController.text,
      "username": _usernameController.text,
      "password": _passwordController.text,
      // "confirmpassword": _confirmpasswordController.text,
    };
    db.collection("users").add(userData);
    return Future(() => true);
  }

  // String? _confirmPasswordValidator(String? value) {
  //   if (value != password) {
  //     return 'Passwords do not match';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).brightness == Brightness.dark
            ? Color.fromRGBO(24, 26, 32, 1)
            : const Color.fromRGBO(234, 236, 239, 1),
        child: SingleChildScrollView(
          child: Form(
            // key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 40.0,
                width: 20.0,
              ),
              BackButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromRGBO(234, 236, 239, 1)
                    : const Color.fromRGBO(24, 26, 32, 1),
              ),
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        Text('Sign Up',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            )),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : Color.fromARGB(255, 223, 6, 6)),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter E-Mail",
                            labelText: "E-Mail",
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : Color.fromARGB(255, 214, 10, 10),
                            ),
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : Color.fromARGB(255, 223, 6, 6),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : Color.fromARGB(255, 223, 6, 6)),
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                            hintStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : Color.fromARGB(255, 223, 6, 6)),
                            labelStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : Color.fromARGB(255, 223, 6, 6)),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : Color.fromARGB(255, 223, 6, 6)),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : Color.fromARGB(255, 223, 6, 6)),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        // TextFormField(
                        //   controller: _confirmpasswordController,
                        //   style: TextStyle(
                        //     color: Theme.of(context).brightness == Brightness.dark
                        //     ? const Color.fromRGBO(234, 236, 239, 1)
                        //     : const Color.fromRGBO(24, 26, 32, 1),
                        //   ),
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     labelText: "Confirm Password",
                        //     labelStyle: TextStyle(
                        //       color: Theme.of(context).brightness == Brightness.dark
                        //       ? const Color.fromRGBO(234, 236, 239, 1)
                        //       : const Color.fromRGBO(24, 26, 32, 1),
                        //     ),
                        //   ),
                        //   validator: _confirmPasswordValidator,
                        // ),
                        const SizedBox(
                          height: 40.0,
                          width: 40.0,
                        ),
                        Center(
                            child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).brightness == Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 0.5)
                                  : Color.fromARGB(255, 223, 6, 6),
                            ),
                          ),
                          child: Text(
                            "Signup",
                            style: TextStyle(
                              color: Color.fromRGBO(234, 236, 239, 1),
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () async {
                            if (await signup() != false) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) => Login_page())));
                            }
                          },
                        )),
                      ]))
            ]),
          ),
        ));
  }
}

//  Text(
//                     "Already a User?",
//                      style: TextStyle(
//                       color: Theme.of(context).brightness ==
//                                      Brightness.dark
//                                     ? const Color.fromRGBO(234, 236, 239, 1)
//                                     : const Color.fromRGBO(24, 26, 32, 1),
//                                 fontSize: 18.0,
//                               ),
//                             ),