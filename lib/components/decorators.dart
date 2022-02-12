import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';

mediaSize(BuildContext context) => MediaQuery.of(context).size;

authdecorator(String hint, IconData icon) => InputDecoration(
      hintText: hint,
      labelText: hint,
      filled: true,
      fillColor: bgColour,
      prefixIcon: Icon(icon, size: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColour),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primaryColour),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );

searchDecoration() => InputDecoration(
      hintText: 'search here',
      filled: true,
      fillColor: bgColour,
      suffixIcon: const Icon(Icons.search_outlined, size: 20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: primaryColour),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: primaryColour),
      ),
    );



couponDecoration() => InputDecoration(
      hintText: 'coupon code here',
      labelText: 'Coupon',
      filled: true,
      fillColor: bgColour,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: primaryColour),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: primaryColour),
      ),
    );
