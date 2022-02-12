import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/widgets/auth/login.dart';
import 'package:grocerymobileapp/widgets/auth/register.dart';

class Authentication extends StatefulWidget {
  static String id = 'auth';
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            //page background
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //welcome text here
            Positioned(
                top: 100,
                right: 70,
                left: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To',
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryColour,
                          ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Grocery App',
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryColour,
                          ),
                    ),
                  ],
                )),
            //authentication widget here
            Positioned(
              top: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadowColor: primaryColour,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            width: mediaSize(context).width * 1,
                            height: 40,
                            child: TabBar(
                              indicatorColor: primaryColour,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.deepOrange,
                              tabs: const [
                                Tab(text: 'Login'),
                                Tab(text: 'Sign Up'),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: mediaSize(context).width * 1,
                            height: 350,
                            child: const TabBarView(
                              children: [
                                Login(),
                                SignUp(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
