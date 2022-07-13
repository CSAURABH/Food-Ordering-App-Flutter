import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/widgets/categories.dart';
import 'package:my_food_ordering_app/widgets/featured_products.dart';
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleWidget(
                      text: "What would you like to eat?",
                      size: 20,
                      colors: black,
                      weight: FontWeight.normal,
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
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
                const Categories(),
                const SizedBox(
                  height: 10,
                ),
                const TitleWidget(
                  text: "Featured",
                  size: 20,
                  colors: Color.fromARGB(255, 73, 72, 72),
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                const FeaturedProduct(),
                const SizedBox(
                  height: 10,
                ),
                const TitleWidget(
                  text: "Popular Food",
                  size: 20,
                  colors: Color.fromARGB(255, 73, 72, 72),
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/food.jpg"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SmallButton(
                          Icons.favorite,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                const Text("4.5"),
                              ],
                            ),
                          ),
                        )
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
                              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: "Pizza with Pork \n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "by: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                  TextSpan(
                                      text: "Papas Pizza \n",
                                      style: TextStyle(fontSize: 16)),
                                ], style: TextStyle(color: white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: "\$25.00 \n",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ], style: TextStyle(color: white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
