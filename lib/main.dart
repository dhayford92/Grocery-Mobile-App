import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocerymobileapp/screens/home.dart';

import 'screens/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groscery App',
      theme: ThemeData.light(),
      home: const SplashScreen(),
      routes: {
        Authentication.id: (context) => const Authentication(),
        HomePage.id: (context)=> const HomePage(),
      },
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
        () => Navigator.of(context).pushReplacementNamed(HomePage.id));
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
