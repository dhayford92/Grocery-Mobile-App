import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/screens/help_page.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:grocerymobileapp/screens/orders_page.dart';
import 'package:grocerymobileapp/utils/carticon.dart';
import 'package:grocerymobileapp/utils/user_provider.dart';
import 'package:provider/provider.dart';

import 'authentication_screen.dart';
import 'favorite_page.dart';
import 'profile_screen.dart';

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
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: Drawer(
        elevation: 8,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                //compang logo nad name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/splash.jpg'),
                      radius: 20,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Grocery App',
                      softWrap: true,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Text(
                  'Denzel Hayford',
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 5),
                Text(
                  '+233 2349876784',
                  softWrap: true,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(height: 30),
            //menu list
            MenuListButton(
              icon: Icons.home_outlined,
              title: 'Home',
              onPress: () => doOpenPage(HomePage.id),
            ),
            MenuListButton(
              icon: Icons.shopping_bag_outlined,
              title: 'Orders',
              onPress: () => doOpenPage(OrdersScreen.id),
            ),
            MenuListButton(
              icon: Icons.favorite_border_outlined,
              title: 'Favorite',
              onPress: () => doOpenPage(FavoriteScreen.id),
            ),
            MenuListButton(
              icon: Icons.person_outlined,
              title: 'Profile',
              onPress: () => doOpenPage(ProfileScreen.id),
            ),
            MenuListButton(
              icon: Icons.mail_outlined,
              title: 'Notifications',
              onPress: () => doOpenPage(HomePage.id),
            ),
            MenuListButton(
              icon: Icons.help_outlined,
              title: 'Help',
              onPress: () => doOpenPage(HelpScreen.id),
            ),
            MenuListButton(
              icon: Icons.info_outline,
              title: 'About Us',
              onPress: () => doOpenPage(HomePage.id),
            ),
            const SizedBox(height: 200),
            CustomButton(
              icon: Icons.logout_outlined,
              title: 'Logout',
              onPress: () =>
                  Navigator.of(context).pushReplacementNamed(Authentication.id),
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
