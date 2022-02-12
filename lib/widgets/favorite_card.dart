import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocerymobileapp/components/buttons.dart';
import 'package:grocerymobileapp/components/colours.dart';
import 'package:grocerymobileapp/components/decorators.dart';

import '../constant.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({Key? key}) : super(key: key);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mediaSize(context).width,
      height: mediaSize(context).height,
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          itemCount: fav_list.length,
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
                      //remove icon
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            fav_list.remove(index);
                          },
                          icon: const Icon(
                            Icons.close,
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
                        Text('${fav_list[index].product!.title}',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                        const SizedBox(height: 8),
                        //Description
                        Text('${fav_list[index].product!.description}',
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
                                Text('₵ ${fav_list[index].product!.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        )),
                                const SizedBox(height: 5),
                                //size
                                Text(
                                  '${fav_list[index].product!.sizeType}',
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
                            ViewButton(product: fav_list[index].product!),
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
