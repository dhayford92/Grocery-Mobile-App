import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColour,
        iconTheme: IconThemeData(color: primaryColour),
        actions: [],
      ),
    );
  }
}