import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/models/product_model.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:grocerymobileapp/screens/product_detail.dart';

//authentication button
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

//view to detail product button
class ViewButton extends StatelessWidget {
  Product product;
  ViewButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 30,
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
  const MenuListButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: primaryColour),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      onTap: onPress,
    );
  }
}

//favorite botton
class FavoriteButton extends StatefulWidget {
  Product product;
  FavoriteButton({Key? key, required this.product}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = true;
        });
      },
      onDoubleTap: () {
        //for practising --removing later
        setState(() {
          isActive = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Icon(Icons.favorite,
              size: 35, color: isActive == true ? primaryColour : Colors.red),
        ),
        decoration: BoxDecoration(
            color: isActive == true ? Colors.red : Colors.white,
            border: Border.all(
                width: 2, color: isActive == true ? Colors.red : primaryColour),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              isActive == true
                  ? const BoxShadow(
                      blurRadius: 7,
                      color: Colors.black26,
                      spreadRadius: 4.0,
                      offset: Offset(-1, 3))
                  : const BoxShadow()
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onPress;
  CustomButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: primaryColour,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 7,
                  color: Colors.black26,
                  spreadRadius: 4.0,
                  offset: Offset(-1, 3))
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, top: 15, right: 50, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 35, color: Colors.white),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
