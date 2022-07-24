import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/models/restaurants.dart';
import 'package:my_food_ordering_app/screens/get_product_by_restaurant.dart';
import 'package:my_food_ordering_app/services/remote_services.dart';
import 'package:my_food_ordering_app/widgets/small_floating_button.dart';

class PopularFood extends StatefulWidget {
  const PopularFood({Key? key}) : super(key: key);

  @override
  State<PopularFood> createState() => _PopularFoodState();
}

class _PopularFoodState extends State<PopularFood> {
  List<Restaurants>? restaurants;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    restaurants = await RemoteServices().getRestaurants();
    if (restaurants != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2600,
      child: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurants?.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GetProductByRestaurant(
                    index: index + 1,
                    restaurants: restaurants![index],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/food.jpg",
                      fit: BoxFit.cover,
                      height: 250,
                      width: 400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0, top: 10),
                        child: GestureDetector(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;
                            // ignore: no_leading_underscores_for_local_identifiers
                            CollectionReference _collectionRef =
                                FirebaseFirestore.instance
                                    .collection("user-favourite-restaurants");

                            return _collectionRef
                                .doc(currentUser!.email)
                                .collection("restaurants")
                                .doc()
                                .set(
                              {
                                "restaurant-name": restaurants![index].name,
                                "restaurant-dishes": restaurants![index].foods,
                                "restaurant-image": restaurants![index].image,
                                "restaurant-ratings":
                                    restaurants![index].ratings,
                              },
                            ).then(
                              (value) => Fluttertoast.showToast(
                                  msg: "Added to Favourite"),
                            );
                          },
                          child: const SmallButton(
                            Icons.favorite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15, bottom: 10),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${restaurants?[index].name}\n",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "${restaurants?[index].foods}\n",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                                style: const TextStyle(color: white),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20, right: 20),
                            child: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow[900],
                                      size: 20,
                                    ),
                                  ),
                                  Text("${restaurants![index].ratings}"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
