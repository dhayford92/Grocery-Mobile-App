import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/mainscreen.dart';

class HelpScreen extends StatefulWidget {
  static String id = "help";
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //page title
          Text(
            'Help Me',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          //text field
          Container(
            height: 350,
            width: mediaSize(context).width,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: authdecorator('title', Icons.title_outlined),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    maxLines: 5,
                    decoration:
                        authdecorator('message', Icons.message_outlined),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(icon: Icons.mail, title: 'Send', onPress: () {})
                ],
              ),
            ),
          ),
          SizedBox(
            width: mediaSize(context).width,
            height: 400,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text(
                      'Content header here',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    children: [
                      Text(
                        'Content message here',
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
