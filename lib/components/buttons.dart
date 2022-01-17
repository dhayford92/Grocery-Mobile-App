import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';

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
