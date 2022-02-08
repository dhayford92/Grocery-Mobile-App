import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/models/product_model.dart';

class ProductListCard extends StatefulWidget {
  ProductListCard({Key? key, required this.product}) : super(key: key);

  Product product;

  @override
  _ProductListCardState createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    end: Alignment.bottomLeft,
                    begin: Alignment.topRight,
                    colors: [
                      colours[index].withOpacity(0.2),
                      colours[index].withOpacity(0.2)
                    ]),
              ),
              child: Column(
                children: [
                  //favorite icon
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                      //product image
                      Padding(
                        padding: EdgeInsets.only(top: index.isEven ? 20 : 30),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 130,
                            height: index.isEven ? 120 : 140,
                            child: Image.asset('assets/images/fruit.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //pruduct title and description, price
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        //title
                        Text('${widget.product.title}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                        const SizedBox(height: 8),
                        //Description
                        Text('${widget.product.description}',
                            softWrap: true,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //price
                            Column(
                              children: [
                                //product price
                                Text('₵ ${widget.product.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        )),
                                const SizedBox(height: 5),
                                //size
                                Text(
                                  '${widget.product.sizeType}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                ),
                              ],
                            ),
                            //buttons
                            ViewButton(product: widget.product),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.3);
          }),
    );
  }
}
