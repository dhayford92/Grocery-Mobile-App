import 'package:flutter/material.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';
import 'package:grocerymobileapp/models/product_model.dart';
import 'package:grocerymobileapp/screens/cart_page.dart';
import 'package:grocerymobileapp/utils/carticon.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product;
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  //increase quantity
  void addtoquantity() {
    setState(() {
      quantity++;
    });
  }

  //reduce quantity
  void reducequantity() {
    setState(() {
      quantity--;
      if (quantity <= 0) {
        quantity += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //percentage discount price
    final double _percen =
        (widget.product.discountPrice! / widget.product.price!) * 100;
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Color(widget.product.colorlabel!.haxCode.hashCode),
        child: Column(
          children: [
            //menu and image
            SizedBox(
              height: mediaSize(context).height / 2 - 30,
              child: Stack(
                children: [
                  Positioned(
                    top: 5,
                    left: 5,
                    right: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back_ios_new, color: primaryColour),
                        ),
                        const CartIcon()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 150,
                        child: Image.asset('assets/images/fruit.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            //product detail
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    //product title
                    Text(
                      '${widget.product.title} - ${widget.product.sizeType}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    //product quantity
                    Text(
                      '${widget.product.quantity} pc (Pieces)',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.bold, color: primaryColour),
                    ),
                    const SizedBox(height: 15),
                    //product description
                    SizedBox(
                      height: 100,
                      child: Text(
                        '${widget.product.description}',
                        softWrap: true,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 15),
                    //quantity and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //quantity creamenting
                        Row(
                          children: [
                            _quantityButton(Icons.add, addtoquantity),
                            const SizedBox(width: 20),
                            Text(
                              '${quantity}',
                              softWrap: true,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(width: 20),
                            _quantityButton(Icons.remove, reducequantity)
                          ],
                        ),
                        //product price
                        Text(
                          'Ghc ${widget.product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.product.isActive == true)
                          Text('Avilable for on sale - With standard delivery'),
                        if (widget.product.isActive == false)
                          Text(
                            'Out of stock and not available for delivery',
                            style: TextStyle(color: Colors.red),
                          ),
                        if (widget.product.discountPrice! >= 1.00)
                          Text(
                            'You Save : ${_percen.toInt()}%',
                            style: TextStyle(color: Colors.green),
                          ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FavoriteButton(product: widget.product),
                        CustomButton(
                          icon: Icons.shopping_bag_outlined,
                          title: 'Bag It',
                          onPress: () {
                            Navigator.of(context).pushNamed(CartScreen.id);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback doChnage) =>
      GestureDetector(
        onTap: doChnage,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: primaryColour),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Icon(icon, color: primaryColour),
          ),
        ),
      );
}
