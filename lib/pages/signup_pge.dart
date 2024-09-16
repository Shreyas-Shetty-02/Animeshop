// import "package:animeshop/pages/login_page.dart";
// import "package:cloud_firestore/cloud_firestore.dart";
// import "package:firebase_auth/firebase_auth.dart";
// import "package:flutter/material.dart";
// import "package:animeshop/pages/home_page.dart";
// import "package:animeshop/utlis/routes.dart";
// import "package:velocity_x/velocity_x.dart";

// class Signup_page extends StatefulWidget {
//   const Signup_page({super.key});

//   @override
//   State<Signup_page> createState() => _Signup_pageState();
// }

// class _Signup_pageState extends State<Signup_page> {
//   //textfiled  Controller
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   Future<bool> signup() async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//           email: _emailController.text, password: _passwordController.text);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "email-already-in-use") {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Email Already In Use")));
//       } else if (e.code == "invalid-email") {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("Email Invalid")));
//       } else if (e.code == "weak-password") {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(const SnackBar(content: Text("Weak Password")));
//       }
//       return Future(() => false);
//     }
//     var db = FirebaseFirestore.instance;
//     var userData = {
//       "email": _emailController.text,
//       "username": _usernameController.text,
//       "password": _passwordController.text
//     };
//     db.collection("users").add(userData);
//     return Future(() => true);
//   }

//   String name = "";
//   bool changeButton = false;
//   // final _fromKey = GlobalKey<FormState>();

//   // moveTohome(BuildContext context) async {
//   //   if (_fromKey.currentState!.validate()) {
//   //     setState(() {
//   //       changeButton = true;
//   //     });
//   //     await Future.delayed(Duration(seconds: 1));
//   //     await Navigator.pushNamed(context, MyRoutes.homeRoute);
//   //     setState(() {
//   //       changeButton = false;
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Animeshop",
//           style: TextStyle(color: context.theme.focusColor),
//         ),
//         centerTitle: true,
//       ),
//       body: Material(
//         color: context.canvasColor,
//         child: Form(
//           // key: _fromKey,
//           child: Material(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "assets/images/shanks.jpeg",
//                     width: 800,
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     "One Piece is Real",
//                     style: TextStyle(
//                       color: context.theme.focusColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 50.0, horizontal: 50.0),
//                     child: Column(
//                       children: [
//                         TextFormField(
//                             controller: _usernameController,
//                             decoration: const InputDecoration(
//                               hintText: "Enter Username",
//                               labelText: "Username",
//                             )),
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _emailController,
//                           decoration: const InputDecoration(
//                             hintText: "Enter Email",
//                             labelText: "Email",
//                           ),
//                           // validator: (value) {
//                           //   if (value!.isEmpty) {
//                           //     return "username cannot be empty";
//                           //   }
//                           //   return null;
//                           // },
//                           // onChanged: (value) {
//                           //   name = value;
//                           //   setState(() {});
//                           // },
//                         ),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             hintText: "Enter Password",
//                             labelText: "Password",
//                           ),
//                           // validator: (value) {
//                           //   if (value!.isEmpty) {
//                           //     return "password cannot be empty";
//                           //   } else if (value!.length < 8) {
//                           //     return "Password should be atleast 8 characters";
//                           //   }
//                           // },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 50.0,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 100,
//                     child: ElevatedButton(
//                       child: Text(
//                         "Signup",
//                         style: TextStyle(color: context.theme.dividerColor),
//                       ),
//                       onPressed: () async {
//                         if (await signup() != false) {
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: ((context) => Login_page())));
//                         }
//                       },
//                       // child: Material(
//                       //   color: context.theme.focusColor,
//                       //   borderRadius:
//                       //       BorderRadius.circular(changeButton ? 20 : 8),
//                       //   child: InkWell(
//                       //     splashColor: Colors.yellow,
//                       //     // onTap: () => moveTohome(context),
//                       //     child: AnimatedContainer(
//                       //       duration: Duration(seconds: 1),
//                       //       width: changeButton ? 50 : 150,
//                       //       height: 50,
//                       //       alignment: Alignment.center,
//                       //       child: changeButton
//                       //           ? Icon(
//                       //               Icons.done,
//                       //               color: Colors.white,
//                       //             )
//                       //           : Text(
//                       //               "Signup",
//                       //               style: TextStyle(
//                       //                 color: context.theme.canvasColor,
//                       //                 fontWeight: FontWeight.bold,
//                       //                 fontSize: 20,
//                       //               ),
//                       //             ),
//                       //     ),
//                       //   ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 50.0,
//                   ),
//                   // Text("Doesnt have account"),
//                   // ElevatedButton(
//                   //   child: Text("Signup"),
//                   //   style: TextButton.styleFrom(minimumSize: Size(10, 10)),
//                   //   onPressed: () {
//                   //     Navigator.pushNamed(context, MyRoutes.SignupRoute);
//                   //   },
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: Drawer(),
//     );
//   }
// }

// // class _LoginPageState extends State<LoginPage> {
// // //LoginFunction
// //   static Future<User?> loginUsingEmailPassword(
// //       {required String email,
// //       required String password,
// //       required BuildContext context}) async {
// //     FirebaseAuth auth = FirebaseAuth.instance;
// //     User? user;
// //     try {
// //       UserCredential userCredential = await auth.signInWithEmailAndPassword(
// //           email: email, password: password);
// //       user = userCredential.user;
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == "user-not-found") {
// //         debugPrint("NO User found for that eamil");
// //       } else if (e.code == "invalid-email") {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(const SnackBar(content: Text("Email Invalid")));
// //       }
// //     }
// //     return user;
// //   }

// //   String name = "";
// //   bool changeButton = false;
// //   // final _fromKey = GlobalKey<FormState>();

// //   // moveTohome(BuildContext context) async {
// //   //   if (_fromKey.currentState!.validate()) {
// //   //     setState(() {
// //   //       changeButton = true;
// //   //     });
// //   //     await Future.delayed(Duration(seconds: 1));
// //   //     await Navigator.pushNamed(context, MyRoutes.homeRoute);
// //   //     setState(() {
// //   //       changeButton = false;
// //   //     });
// //   //   }
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// // //textfiled  Controller
// //     TextEditingController _emailController = TextEditingController();
// //     TextEditingController _passwordController = TextEditingController();

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           "One Piece",
// //           style: TextStyle(color: context.theme.focusColor),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Material(
// //         color: context.canvasColor,
// //         child: Form(
// //           // key: _fromKey,
// //           child: Material(
// //             child: SingleChildScrollView(
// //               child: Column(
// //                 children: [
// //                   Image.asset(
// //                     "assets/images/shanks.jpeg",
// //                     width: 800,
// //                   ),
// //                   SizedBox(height: 20.0),
// //                   Text(
// //                     "One Piece is Real",
// //                     style: TextStyle(
// //                       color: context.theme.focusColor,
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.0,
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 50.0, horizontal: 50.0),
// //                     child: Column(
// //                       children: [
// //                         TextFormField(
// //                           keyboardType: TextInputType.emailAddress,
// //                           controller: _emailController,
// //                           decoration: const InputDecoration(
// //                             hintText: "Enter Email",
// //                             labelText: "Email",
// //                           ),
// //                           // validator: (value) {
// //                           //   if (value!.isEmpty) {
// //                           //     return "username cannot be empty";
// //                           //   }
// //                           //   return null;
// //                           // },
// //                           // onChanged: (value) {
// //                           //   name = value;
// //                           //   setState(() {});
// //                           // },
// //                         ),
// //                         TextFormField(
// //                           controller: _passwordController,
// //                           obscureText: true,
// //                           decoration: const InputDecoration(
// //                             hintText: "Enter Password",
// //                             labelText: "Password",
// //                           ),
// //                           // validator: (value) {
// //                           //   if (value!.isEmpty) {
// //                           //     return "password cannot be empty";
// //                           //   } else if (value!.length < 8) {
// //                           //     return "Password should be atleast 8 characters";
// //                           //   }
// //                           // },
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 50.0,
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: () async {
// //                       //App Test

// //                       User? user = await loginUsingEmailPassword(
// //                           email: _emailController.text.trim(),
// //                           password: _passwordController.text,
// //                           context: context);
// //                       print(user);
// //                       if (user != null) {
// //                         Navigator.of(context).pushReplacement(MaterialPageRoute(
// //                             builder: ((context) => HomePage())));
// //                       }
// //                     },
// //                     child: Material(
// //                       color: context.theme.focusColor,
// //                       borderRadius:
// //                           BorderRadius.circular(changeButton ? 20 : 8),
// //                       child: InkWell(
// //                         splashColor: Colors.yellow,
// //                         // onTap: () => moveTohome(context),
// //                         child: AnimatedContainer(
// //                           duration: Duration(seconds: 1),
// //                           width: changeButton ? 50 : 150,
// //                           height: 50,
// //                           alignment: Alignment.center,
// //                           child: changeButton
// //                               ? Icon(
// //                                   Icons.done,
// //                                   color: Colors.white,
// //                                 )
// //                               : Text(
// //                                   "Login",
// //                                   style: TextStyle(
// //                                     color: context.theme.canvasColor,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 20,
// //                                   ),
// //                                 ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 50.0,
// //                   ),
// //                   Text("Doesnt have account"),
// //                   ElevatedButton(
// //                     child: Text("Signup"),
// //                     style: TextButton.styleFrom(minimumSize: Size(10, 10)),
// //                     onPressed: () {
// //                       Navigator.pushNamed(context, MyRoutes.SignupRoute);
// //                     },
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //       drawer: Drawer(),
// //     );
// //   }
// // }
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : const Color.fromRGBO(24, 26, 32, 1),
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter E-Mail",
                            labelText: "E-Mail",
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                            ),
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        TextFormField(
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : const Color.fromRGBO(24, 26, 32, 1),
                          ),
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                            hintStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                            ),
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 20.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromRGBO(234, 236, 239, 1)
                                    : const Color.fromRGBO(24, 26, 32, 1),
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromRGBO(234, 236, 239, 1)
                                  : const Color.fromRGBO(24, 26, 32, 1),
                            ),
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
                                  : const Color.fromRGBO(24, 26, 32, 0.5),
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