import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/food_screens/burger_screen.dart';
import 'package:my_food_ordering_app/food_screens/fries_screen.dart';
import 'package:my_food_ordering_app/food_screens/home_style_screen.dart';
import 'package:my_food_ordering_app/food_screens/pizza_screen.dart';
import 'package:my_food_ordering_app/food_screens/rolls_screen.dart';
import 'package:my_food_ordering_app/food_screens/samosa_screen.dart';
import 'package:my_food_ordering_app/food_screens/sandwich_screen.dart';
import 'package:my_food_ordering_app/food_screens/thali_screen.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/drawer.dart';
import 'package:my_food_ordering_app/widgets/featured_products.dart';
import 'package:my_food_ordering_app/widgets/popular_food.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Zomato"),
        centerTitle: true,
      ),
      drawer: const DrawerScreen(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: grey,
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // hintStyle: TextStyle(fontSize: 20),
                          hintText: "Find food or Restaurant",
                        ),
                      ),
                      trailing: Icon(Icons.filter_list),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TitleWidget(
                    text: "Eat what makes you happy",
                    size: 20,
                    colors: Color.fromARGB(255, 73, 72, 72),
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PizzaScreen(),
                              ),
                            ),
                            image: "assets/images/food1.png",
                            text: "Pizza",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BurgerScreen(),
                              ),
                            ),
                            image: "assets/images/food2.png",
                            text: "Burger",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SandwichScreen(),
                              ),
                            ),
                            image: "assets/images/food3.png",
                            text: "Sandwich",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RollsScreen(),
                              ),
                            ),
                            image: "assets/images/food4.png",
                            text: "Rolls",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeStyleScreen(),
                              ),
                            ),
                            image: "assets/images/food5.png",
                            text: "Home Style",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FriesScreen(),
                              ),
                            ),
                            image: "assets/images/food6.png",
                            text: "Fries",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThaliScreen(),
                              ),
                            ),
                            image: "assets/images/food7.png",
                            text: "Thali",
                          ),
                          FeaturedImage(
                            imageTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SamosaScreen(),
                              ),
                            ),
                            image: "assets/images/food8.png",
                            text: "Samosa",
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TitleWidget(
                    text: "Popular Restaurants",
                    size: 20,
                    colors: Color.fromARGB(255, 73, 72, 72),
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const PopularFood(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
