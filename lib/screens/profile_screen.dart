import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/addlocation.dart';
import 'package:grocerymobileapp/screens/mainscreen.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          //page title
          Text(
            'Profile Settings',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            width: mediaSize(context).width,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full name',
                      style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: authdecorator('denzel Hayford', Icons.person),
                  ),
                  const SizedBox(height: 20),
                  Text('Email', style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: authdecorator('denzel@mail.com', Icons.email),
                  ),
                  const SizedBox(height: 20),
                  Text('Mobile number',
                      style: Theme.of(context).textTheme.subtitle2),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: authdecorator('+233 00 000 0000', Icons.person),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                      icon: Icons.update_outlined,
                      title: 'Update',
                      onPress: () {})
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed(AddNewLocation.id),
            child: const Text(
              'Add Your Location',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
