import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/mainscreen.dart';
import 'package:grocerymobileapp/widgets/favorite_card.dart';

class FavoriteScreen extends StatefulWidget {
  static String id = 'fav';
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  TextEditingController searchtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          //page title
          Text(
            'My Favorite',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
           const SizedBox(height: 10),
          //search text field here
          SizedBox(
            height: 60,
            child: TextField(
              controller: searchtext,
              decoration: searchDecoration(),
            ),
          ),
          const SizedBox(height: 10),
          const FavoriteCard()
        ],
      ),
    );
  }
}
