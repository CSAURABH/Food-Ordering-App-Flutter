import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
// ignore: unused_field
  final List _dishes = [];

  fetchRestaurantDishes() async {
    // ignore: unused_local_variable
    QuerySnapshot qn = await FirebaseFirestore.instance
        .collection("restaurants-items")
        .where("id", isEqualTo: widget.index)
        .get();

    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _dishes.add({
          "image": qn.docs[i]["image"],
          "name": qn.docs[i]["name"],
          "price": qn.docs[i]["price"]
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRestaurantDishes();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540,
      child: ListView.builder(
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 10),
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
                        _dishes[index]["image"],
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
                                text: _dishes[index]["name"],
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
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      var currentUser =
                                          FirebaseAuth.instance.currentUser;
                                      CollectionReference _collectionRef =
                                          FirebaseFirestore.instance.collection(
                                              "user-favourite-dishes");

                                      return _collectionRef
                                          .doc(currentUser!.email)
                                          .collection("dishes")
                                          .doc()
                                          .set({
                                        "name": _dishes[index]["name"],
                                        "price": _dishes[index]["price"],
                                        "image": _dishes[index]["image"]
                                      }).then(
                                        (value) => Fluttertoast.showToast(
                                            msg: "Added to Favourite"),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.favorite_border,
                                      color: red,
                                      size: 18,
                                    ),
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
                                text: "\$${_dishes[index]["price"]}",
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
  }
}
