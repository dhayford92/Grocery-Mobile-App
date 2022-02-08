import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/models/category_model.dart';
import 'package:grocerymobileapp/models/product_model.dart';
import 'package:grocerymobileapp/screens/mainscreen.dart';
import 'package:grocerymobileapp/widgets/product_list.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchtext = TextEditingController();

  List<Tab> cattabs = [];
  List<Widget> productTab = [];

  //function to get all category into taps
  void getCategory() {
    cattabs = [];
    for (int i = 1; i <= cate_list.length-1; i++) {
      cattabs = [Tab(text: cate_list[i].title)];
    }
  }

  //function to get all product of a category
  void getproduct() {
    productTab = [];
    for (int i = 1; i <= cate_list.length-1; i++) {
      productTab = [ProductListCard(product: prod_list[i])];
    }
  }

  @override
  Widget build(BuildContext context) {
    getCategory(); // call function
    getproduct();
    return MainScreen(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
        child: Column(
          children: [
            //search text field here
            SizedBox(
              height: 60,
              child: TextField(
                controller: searchtext,
                decoration: searchDecoration(),
              ),
            ),
            const SizedBox(height: 10),
            //category tabs and product page
            SizedBox(
              height: mediaSize(context).height - 146,
              child: DefaultTabController(
                length: cattabs.length,
                initialIndex: 0,
                child: Column(
                  children: [
                    //category Tab Bar
                    SizedBox(
                      height: 50,
                      width: mediaSize(context).width,
                      child: TabBar(
                        unselectedLabelColor: Colors.black,
                        indicatorColor: primaryColour,
                        labelColor: primaryColour,
                        tabs: cattabs,
                      ),
                    ),
                    const SizedBox(height: 10),
                    //product list pages
                    Flexible(
                      child: TabBarView(
                      
                        children: productTab,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
