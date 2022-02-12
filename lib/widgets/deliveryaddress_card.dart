import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/screens/addlocation.dart';

class DeliveryAddressCard extends StatefulWidget {
  DeliveryAddressCard({Key? key, required this.isActive}) : super(key: key);

  bool isActive;

  @override
  State<DeliveryAddressCard> createState() => _DeliveryAddressCardState();
}

class _DeliveryAddressCardState extends State<DeliveryAddressCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(AddNewLocation.id),
          child: Card(
            shadowColor: Colors.black26,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 50, bottom: 50),
              child: Icon(Icons.add, size: 30, color: primaryColour),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: mediaSize(context).width - 80,
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (widget.isActive == true) {
                      setState(() {
                        widget.isActive = false;
                      });
                    } else {
                      setState(() {
                        widget.isActive = true;
                      });
                    }
                  },
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
                          children: [
                            const Text('Delivery to: '),
                            widget.isActive == true
                                ? Icon(Icons.circle_outlined,
                                    color: primaryColour)
                                : Icon(Icons.circle_rounded,
                                    color: primaryColour),
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
          ),
        )
      ],
    );
  }
}
