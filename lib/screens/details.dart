import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/models/products.dart';
import 'package:my_food_ordering_app/widgets/small_floating_button.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

class DetailsScreen extends StatefulWidget {
  final Products product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Carousel(
                    images: [
                      Image.asset("assets/images/${widget.product.image}"),
                      Image.asset("assets/images/${widget.product.image}"),
                      Image.asset("assets/images/${widget.product.image}"),
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
                          color: black,
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
                                color: black,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(1),
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
                    bottom: 50,
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
              text: widget.product.name,
              size: 26,
              colors: black,
              weight: FontWeight.bold,
            ),
            TitleWidget(
              text: "\$${widget.product.price}",
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
                  onPressed: () {},
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
                  child: const Text(
                    "Add to Bag",
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    size: 36,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
