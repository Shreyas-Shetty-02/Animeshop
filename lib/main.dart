import 'package:animeshop/pages/default_page.dart';
import 'package:animeshop/pages/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:animeshop/core/store.dart';
import 'package:animeshop/pages/cart_page.dart';
import 'package:animeshop/pages/home_page.dart';
import 'package:animeshop/pages/login_page.dart';
import 'package:animeshop/pages/signup_pge.dart';
import 'package:animeshop/utlis/routes.dart';
import 'package:animeshop/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const Login_page(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => const Login_page(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.SignupRoute: (context) => const Signup(),
        MyRoutes.SampleRoute: (context) => const Sample_Page(),
      },
    );
  }
}
