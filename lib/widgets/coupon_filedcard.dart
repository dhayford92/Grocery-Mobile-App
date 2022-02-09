import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/decorators.dart';

class CouponFieldCard extends StatelessWidget {
  const CouponFieldCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          SizedBox(
            height: 70,
            width: 300,
            child: TextField(decoration: couponDecoration()),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.add, size: 30),
                )),
          ),
        ],
      ),
    );
  }
}
