import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/screens/addlocation.dart';
import 'package:grocerymobileapp/screens/cart_page.dart';
import 'package:grocerymobileapp/screens/checkout.dart';
import 'package:grocerymobileapp/screens/favorite_page.dart';
import 'package:grocerymobileapp/screens/help_page.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:grocerymobileapp/screens/orders_page.dart';
import 'package:grocerymobileapp/screens/profile_screen.dart';
import 'package:grocerymobileapp/utils/local_store.dart';
import 'package:grocerymobileapp/utils/user_provider.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPref().getUser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groscery App',
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: bgColour,
            primaryColor: primaryColour,
            buttonColor: primaryColour,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColour)),
            ),
            canvasColor: Colors.white),
        home: const SplashScreen(),
        routes: {
          Authentication.id: (context) => const Authentication(),
          HomePage.id: (context) => const HomePage(),
          CartScreen.id: (context) => const CartScreen(),
          CheckoutScreen.id: (context) => const CheckoutScreen(),
          OrdersScreen.id: (context) => const OrdersScreen(),
          FavoriteScreen.id: (context) => const FavoriteScreen(),
          ProfileScreen.id: (context) => const ProfileScreen(),
          AddNewLocation.id: (context) => const AddNewLocation(),
          HelpScreen.id: (context) => const HelpScreen(),
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
        () => Navigator.of(context).pushReplacementNamed(Authentication.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            //app background
            Container(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8)
                  ],
                  end: Alignment.topRight,
                )),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //app name or logo here
            Positioned(
              top: 250,
              left: 45,
              right: 40,
              child: Text(
                'Grocery App',
                softWrap: true,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//notifications page
//about us
//api connects
//Classify function