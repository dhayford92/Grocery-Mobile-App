import 'package:flutter/material.dart';
import 'package:grocerymobileapp/constant.dart';
import 'package:grocerymobileapp/models/order_model.dart';
import 'package:grocerymobileapp/screens/mainscreen.dart';
import 'package:grocerymobileapp/screens/order_detail_page.dart';

class OrdersScreen extends StatefulWidget {
  static String id = 'order';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            //page title
            Text(
              'My Orders',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            //order card
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: order_list.length,
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => OrderDetailScreen(
                          order: order_list[index],
                        ),
                      ),
                    ),
                    child: Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //ID and date
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //order id
                                  Text(
                                    'Order#: ${order_list[index].orderID}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  //date
                                  Text(
                                    '${order_list[index].updated}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.black45),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              //status and rating
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //status
                                  if (OrderStatus.Pending ==
                                      order_list[index].orderStatus) //pending
                                    Text('status: Pending',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.blue)),
                                  if (OrderStatus.Confirmed ==
                                      order_list[index].orderStatus) //confirmed
                                    Text('status: Confirmed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.greenAccent)),
                                  if (OrderStatus.Delivered ==
                                      order_list[index].orderStatus) //delivered
                                    Text(
                                      'status: Delivered',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.green),
                                    ),
                                  if (OrderStatus.Cancelled ==
                                      order_list[index].orderStatus) //cancelled
                                    Text(
                                      'status: Canceled',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.red),
                                    ),
                                  if (OrderStatus.Refund ==
                                      order_list[index].orderStatus) //delivered
                                    Text('status: Refund',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.orange)),
                                  if (OrderStatus.ReadyPickup ==
                                      order_list[index]
                                          .orderStatus) //ready pick up
                                    Text('status: Picked Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.orange)),
                                  if (OrderStatus.Sending ==
                                      order_list[index].orderStatus) //send..
                                    Text('status: Order on it way',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.grey)),
                                  //rating
                                  Row(
                                    children: [
                                      Text('Rating',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!),
                                      const SizedBox(width: 10),
                                      Row(children: emp_icons_list)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//work on the rating stars