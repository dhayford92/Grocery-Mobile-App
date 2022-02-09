import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/widgets/coupon_filedcard.dart';
import 'package:grocerymobileapp/widgets/deliveryaddress_card.dart';
import 'package:grocerymobileapp/widgets/order_success_card.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'checkout';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool is_pickup = false; //pick up
  bool is_coupon_add = false;

  @override
  Widget build(BuildContext context) {
    //text style
    textheaderstyle() => Theme.of(context)
        .textTheme
        .subtitle1!
        .copyWith(fontWeight: FontWeight.w400);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: primaryColour),
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColour),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //order type
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    is_pickup = true;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 20, left: 20),
                    child: const Center(
                      child: Text(
                        'Pick Up',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: bgColour,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: bgColour,
                        ),
                        boxShadow: [
                          if (is_pickup == true)
                            const BoxShadow(
                              blurRadius: 7,
                              offset: Offset(-1, 3),
                              spreadRadius: 2,
                              color: Colors.black12,
                            )
                        ]),
                  ),
                ),
                const SizedBox(width: 20),
                //Delivery
                GestureDetector(
                  onTap: () => setState(() {
                    is_pickup = false;
                  }),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 20, left: 20),
                    child: const Center(
                      child: Text(
                        'Delivery',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: bgColour,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: bgColour,
                        ),
                        boxShadow: [
                          if (is_pickup == false)
                            const BoxShadow(
                              blurRadius: 7,
                              offset: Offset(-1, 3),
                              spreadRadius: 2,
                              color: Colors.black12,
                            )
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            //delivery address
            if (is_pickup == false)
              Container(
                width: mediaSize(context).width,
                height: 180,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: textheaderstyle(),
                    ),
                    const SizedBox(height: 10),
                    DeliveryAddressCard(isActive: false),
                  ],
                ),
              ),
            if (is_pickup == false) const SizedBox(height: 10),
            //orders items
            Expanded(
              child: Container(
                width: mediaSize(context).width,
                height: is_pickup == false ? 210 : 280,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Text(
                      'Order Items',
                      style: textheaderstyle(),
                    ),
                    const SizedBox(height: 5),
                    //items
                    Container(
                      width: mediaSize(context).width,
                      height: is_pickup == false ? 150 : 180,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (_, index) => const ListTile(
                          title: Text('Product name'),
                          trailing: Text('Qty: 2x'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //coupon field here
            if (is_coupon_add == false) const CouponFieldCard(),
            if (is_coupon_add == true)
              Text(
                'Ghc 12.00 Coupon Added Successfully',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: primaryColour,
                    ),
              ),
            //delivery price
            if (is_pickup == false)
              const ListTile(
                title: Text('Delivery Price'),
                subtitle: Text('Ghc '),
              ),
            //total price
            const ListTile(
              title: Text('Total'),
              subtitle: Text('Ghc '),
            ),
            //order button
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CustomButton(
                icon: Icons.done,
                title: 'Processed',
                onPress: () => showDialog(context: context, builder: (BuildContext builder)=>const OrderSuccessCard()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
