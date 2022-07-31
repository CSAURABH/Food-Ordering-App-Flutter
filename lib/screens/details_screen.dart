// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  int price;

  DetailsScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ],
                    autoplay: false,
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: white,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Stack(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.shopping_bag_outlined,
                                color: white,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 7,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 3, left: 3, top: 1, bottom: 1),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: grey,
                                      offset: Offset(2, 1),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: const TitleWidget(
                                  text: "2",
                                  size: 16,
                                  colors: red,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 70,
                    right: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: grey,
                            offset: Offset(2, 3),
                            blurRadius: 3,
                          ),
                        ],
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            TitleWidget(
              text: "${widget.name}\n",
              size: 26,
              colors: black,
              weight: FontWeight.bold,
            ),
            TitleWidget(
              text: "\$${widget.price}",
              size: 20,
              colors: red,
              weight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (qty > 1) {
                          qty--;
                        }
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 36,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text(
                    qty.toString(),
                    style: const TextStyle(color: white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        qty++;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 36,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("Cart")
                      .doc(FirebaseAuth.instance.currentUser!.email)
                      .collection("cart-items")
                      .doc()
                      .set(
                    {
                      "cart-item-name": widget.name,
                      "cart-item-image": widget.image,
                      "cart-item-price": widget.price,
                      "cart-item-quantity": qty
                    },
                  ).then((value) =>
                          Fluttertoast.showToast(msg: "Added To Cart"));
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
