import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/models/restaurants.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

class RestaurantProducts extends StatefulWidget {
  final int index;
  final Restaurants restaurants;
  const RestaurantProducts({
    Key? key,
    required this.restaurants,
    required this.index,
  }) : super(key: key);

  @override
  State<RestaurantProducts> createState() => RestaurantProductsState();
}

class RestaurantProductsState extends State<RestaurantProducts> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("restaurants-items")
          .where("id", isEqualTo: widget.index)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: 540,
          child: ListView.builder(
            itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              // ignore: no_leading_underscores_for_local_identifiers
              DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(
                    left: 4, right: 4, top: 4, bottom: 10),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 224, 224, 224),
                          offset: Offset(-2, -1),
                          blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 140,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          child: Image.network(
                            _documentSnapshot["image"],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TitleWidget(
                                    text: _documentSnapshot["name"],
                                    size: 18,
                                    colors: black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: white,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 224, 224, 224),
                                              offset: Offset(1, 1),
                                              blurRadius: 4),
                                        ]),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: red,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Row(
                                children: <Widget>[
                                  const TitleWidget(
                                    text: "form:",
                                    size: 14,
                                    colors: Color.fromARGB(255, 137, 134, 134),
                                    weight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  GestureDetector(
                                    onTap: () async {},
                                    child: TitleWidget(
                                      text: widget.restaurants.name,
                                      size: 14,
                                      colors: Colors.red,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: TitleWidget(
                                        text: "4.2",
                                        size: 14,
                                        colors: Color.fromARGB(255, 94, 91, 91),
                                        weight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: red,
                                      size: 16,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: grey,
                                      size: 16,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: TitleWidget(
                                    text: "\$${_documentSnapshot["price"]}",
                                    size: 16,
                                    colors: black,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
