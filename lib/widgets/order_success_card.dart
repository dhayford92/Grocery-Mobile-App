import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/screens/home.dart';
import 'package:grocerymobileapp/screens/orders_page.dart';

class OrderSuccessCard extends StatelessWidget {
  const OrderSuccessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: AnimatedContainer(
        height: 500,
        duration: const Duration(milliseconds: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
                backgroundColor: primaryColour,
                child: const Icon(Icons.done_rounded, size: 50),
                radius: 50),
            const SizedBox(height: 40),
            const Text(
              'Your order is',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const Text(
              'Successful',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'You can track the delivery in the',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Order Session',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed(HomePage.id),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Continue Shopping'),
                )),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () =>Navigator.of(context).pushReplacementNamed(OrdersScreen.id),
              child: Text(
                'Go to orders',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
