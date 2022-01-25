import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/models/product_model.dart';
import 'package:grocerymobileapp/screens/home.dart';

class AuthButton extends StatelessWidget {
  AuthButton({Key? key, required this.onPress, required this.title})
      : super(key: key);
  String title;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColour),
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  Product product;
  ViewButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomePage()));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(primaryColour),
      ),
    );
  }
}

class MenuListButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;
  const MenuListButton({Key? key, required this.icon, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: primaryColour),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      onTap: onPress,
    );
  }
}
