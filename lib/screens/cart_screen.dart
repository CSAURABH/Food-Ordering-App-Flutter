import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/models/products.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Products products = Products(
        name: "Cereals",
        image: "1.jpg",
        rating: 4.7,
        price: 12.99,
        vendor: "Good Food",
        wishList: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const TitleWidget(
          text: "Item Carts",
          size: 18,
          colors: black,
          weight: FontWeight.bold,
        ),
        actions: [
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 235, 238),
                    offset: Offset(3, 5),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/${products.image}",
                    width: 120,
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${products.name}\n",
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: "${products.price.toString()}\n",
                              style: const TextStyle(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 255, 235, 238),
                    offset: Offset(3, 5),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/${products.image}",
                    width: 120,
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${products.name}\n",
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: "${products.price.toString()}\n",
                              style: const TextStyle(
                                color: black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
