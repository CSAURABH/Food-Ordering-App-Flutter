import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/widgets/small_floating_button.dart';

class PopularFood extends StatefulWidget {
  const PopularFood({Key? key}) : super(key: key);

  @override
  State<PopularFood> createState() => _PopularFoodState();
}

class _PopularFoodState extends State<PopularFood> {
  // ignore: prefer_final_fields
  List _restaurants = [];
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("restaurants").get();
    setState(
      () {
        for (int i = 0; i < qn.docs.length; i++) {
          _restaurants.add(
            {
              "foods": qn.docs[i]["foods"],
              "image": qn.docs[i]["image"],
              "name": qn.docs[i]["name"],
              "ratings": qn.docs[i]["ratings"],
            },
          );
        }
      },
    );

    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2600,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _restaurants.length,
        itemBuilder: (context, index) => Container(
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
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 25.0, top: 10),
                    child: SmallButton(
                      Icons.favorite,
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
                        padding: const EdgeInsets.only(left: 15, bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: _restaurants[index]["name"] + "\n\n",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: _restaurants[index]["foods"] + " \n",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                            style: const TextStyle(color: white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, right: 20),
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
                              Text(_restaurants[index]["ratings"].toString()),
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
    );
  }
}
