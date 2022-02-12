import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';

class DeliveryCardNew extends StatefulWidget {
  const DeliveryCardNew({Key? key}) : super(key: key);

  @override
  _DeliveryCardNewState createState() => _DeliveryCardNewState();
}

class _DeliveryCardNewState extends State<DeliveryCardNew> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaSize(context).width - 80,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColour),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //active icon and title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Delivery to: '),
                      Icon(Icons.close, color: Colors.red),
                    ],
                  ),
                  //location
                  Row(
                    children: [
                      Icon(
                        Icons.location_city_outlined,
                        color: primaryColour,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Ghana, Accra Airport Resdientail Str',
                        softWrap: true,
                      ),
                    ],
                  ),
                  //mobile number
                  Row(
                    children: [
                      Icon(
                        Icons.phone_android_outlined,
                        color: primaryColour,
                      ),
                      const SizedBox(width: 10),
                      const Text('+233 24-222-2222'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
