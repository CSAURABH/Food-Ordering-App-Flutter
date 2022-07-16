import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/drawer.dart';
import 'package:my_food_ordering_app/widgets/categories.dart';
import 'package:my_food_ordering_app/widgets/featured_products.dart';
import 'package:my_food_ordering_app/widgets/popular_food.dart';
import 'package:my_food_ordering_app/widgets/small_floating_button.dart';
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
          child: SingleChildScrollView(
            child: Column(
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
                      children: const [
                        FeaturedImage(
                          image: "assets/images/food1.jpg",
                          text: "Grilled fish",
                        ),
                        FeaturedImage(
                          image: "assets/images/food2.jpg",
                          text: "Grilled chicken",
                        ),
                        FeaturedImage(
                          image: "assets/images/food3.jpg",
                          text: "Noodles",
                        ),
                        FeaturedImage(
                          image: "assets/images/food4.jpg",
                          text: "Salad",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        FeaturedImage(
                          image: "assets/images/food5.jpg",
                          text: "Brazilian  dish",
                        ),
                        FeaturedImage(
                          image: "assets/images/food6.jpg",
                          text: "Desert",
                        ),
                        FeaturedImage(
                          image: "assets/images/food7.jpg",
                          text: "French Fries",
                        ),
                        FeaturedImage(
                          image: "assets/images/food8.jpg",
                          text: "Chicken",
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
                const PopularFood(),
                const PopularFood(),
                const PopularFood(),
                const PopularFood(),
                const PopularFood(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
