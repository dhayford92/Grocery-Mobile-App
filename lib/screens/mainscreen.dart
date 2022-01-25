import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:grocerymobileapp/utils/carticon.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main';
  MainScreen({Key? key, required this.child}) : super(key: key);

  Widget child;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //open menu page function
  void doOpenPage(String page) {
    Navigator.of(context).pushReplacementNamed(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        elevation: 8,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Denzel Hayford',
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 10),
                Text(
                  '+233 00 000 0000',
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            MenuListButton(
              icon: Icons.home,
              title: 'Home',
              onPress: () => doOpenPage(HomePage.id),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColour),
        actions: const [CartIcon()],
      ),
      body: SafeArea(
        child: widget.child,
      ),
    );
  }
}
