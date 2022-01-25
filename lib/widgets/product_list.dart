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
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                      colors: [
                        colours[index].withOpacity(0.2),
                        colours[index].withOpacity(0.2)
                      ]),),
              child: Column(
                children: [
                  //favorite icon
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.favorite_outline, color: Colors.red)),
                      Spacer(),
                    ],
                  ),
                  //product image
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: Image.asset(widget.product.image.toString()),
                  ),
                  //pruduct title and description, price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      //title
                      Text(
                        '${widget.product.title}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      //Description
                      Text(
                        '${widget.product.description}',
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        title: Text(
                          '₵ ${widget.product.price}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        subtitle: Text(
                          '${widget.product.sizeTyoe}',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                        ),
                        trailing: ViewButton(product: widget.product),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
          }),
    );
  }
}
