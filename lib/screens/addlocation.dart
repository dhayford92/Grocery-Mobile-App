import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/widgets/deliverycardnew.dart';

class AddNewLocation extends StatefulWidget {
  static String id = "addnewlocation";
  const AddNewLocation({Key? key}) : super(key: key);

  @override
  _AddNewLocationState createState() => _AddNewLocationState();
}

class _AddNewLocationState extends State<AddNewLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: primaryColour),
        title: Text(
          'Add New Location',
          style: TextStyle(fontWeight: FontWeight.bold, color: primaryColour),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //address
            SizedBox(
              width: mediaSize(context).width,
              height: 110,
              child: const DeliveryCardNew(),
            ),
            const SizedBox(height: 20),
            Container(
              height: 400,
              padding: const EdgeInsets.all(10),
              width: mediaSize(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: authdecorator('City', Icons.location_city),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: authdecorator('Address', Icons.location_city),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                        icon: Icons.add, title: 'Add Location', onPress: () {})
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
