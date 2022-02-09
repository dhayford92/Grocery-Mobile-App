import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/models/product_model.dart';

class ProductListCard extends StatefulWidget {
  ProductListCard({Key? key, this.category}) : super(key: key);

  int? category;

  @override
  _ProductListCardState createState() => _ProductListCardState();
}

class _ProductListCardState extends State<ProductListCard> {
  //favorite active
  bool is_active = false;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: prod_list.length,
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
                  //image and icon fav
                  Stack(
                    children: [
                      //favorite icon
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            if (is_active == false) {
                              setState(() {
                                is_active = true;
                              });
                            } else {
                              setState(() {
                                is_active = false;
                              });
                            }
                          },
                          icon: is_active == false? const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                            size: 30,
                          ):const Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                      //product image
                      Padding(
                        padding: EdgeInsets.only(top: index.isEven ? 26 : 30),
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
                        Text('${prod_list[index].title}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                        const SizedBox(height: 8),
                        //Description
                        Text('${prod_list[index].description}',
                            softWrap: true,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
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
                                Text('₵ ${prod_list[index].price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        )),
                                const SizedBox(height: 5),
                                //size
                                Text(
                                  '${prod_list[index].sizeType}',
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
                            ViewButton(product: prod_list[index]),
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
            return StaggeredTile.count(1, index.isEven ? 1.6 : 1.7);
          }),
    );
  }
}
