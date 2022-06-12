import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/models/order_model.dart';
import 'package:grocerymobileapp/utils/carticon.dart';
import '../constant.dart';

class OrderDetailScreen extends StatefulWidget {
  Order order;
  OrderDetailScreen({Key? key, required this.order}) : super(key: key);

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int current_step = 0;

  @override
  Widget build(BuildContext context) {
    // -- Order status steps -- //
    List<Step> status_step = [
      const Step(
        title: Text('Pending'),
        content: Text('Checking through your order'),
      ),
      const Step(
        title: Text('Confirmed'),
        content: Text('Your order has been confirmed'),
      ),
      if (widget.order.orderType == OrderType.PickUp)
        const Step(
          title: Text('Ready for pickup'),
          content: Text('Your order is ready for pickup'),
        ),
      if (widget.order.orderType == OrderType.Delivery)
        const Step(
          title: Text('Sending'),
          content: Text('Your order is on it way'),
        ),
      if (widget.order.orderType == OrderType.Delivery)
        const Step(
          title: Text('Delivered'),
          content: Text('Your order is here now'),
        ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: primaryColour),
        actions: const [CartIcon()],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            //page title
            Text(
              'Track Orders',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //order id
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          'order#: ${widget.order.orderID}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ),
                    Divider(color: primaryColour),
                    //list of items
                    ExpansionTile(
                      title: Text(
                        'List of items',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      subtitle: Text('Total : ${widget.order.total}',
                          style: Theme.of(context).textTheme.bodyText1),
                      children: [
                        SizedBox(
                          width: mediaSize(context).width,
                          height: widget.order.items!.length >= 4 ? 300 : 150,
                          child: ListView.builder(
                            itemCount: widget.order.items!.length,
                            itemBuilder: (_, index) => ListTile(
                              title: Text(
                                '${widget.order.items![index].product!.title}',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              subtitle: Text(
                                'Ghc ${widget.order.items![index].totalPrice}',
                                style: const TextStyle(fontSize: 10),
                              ),
                              trailing: SizedBox(
                                child: Image.asset(
                                    '${widget.order.items![0].product!.image}'),
                              ),
                            ),
                          ),
                        ),
                        //rating
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Rating'),
                              Row(
                                children: emp_icons_list,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: primaryColour),
                    //order status
                    ExpansionTile(
                      title: Text('Track orders',
                          style: Theme.of(context).textTheme.bodyText1),
                      subtitle: Text('Status',
                          style: Theme.of(context).textTheme.bodyText2),
                      children: [
                        SizedBox(
                          height: 400,
                          width: mediaSize(context).width,
                          child: Stepper(
                            currentStep: current_step,
                            steps: status_step,
                            type: StepperType.vertical,
                            onStepCancel: () {
                              if (current_step > 0) {
                                setState(() {
                                  current_step -= 1;
                                });
                              }
                            },
                            onStepContinue: () {
                              if (current_step <= 0) {
                                setState(() {
                                  current_step += 1;
                                });
                              }
                            },
                            // controlsBuilder: (context,
                            //     {onStepCancel, onStepContinue}) {
                            //   assert(context != null);
                            //   return Row();
                            // },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
