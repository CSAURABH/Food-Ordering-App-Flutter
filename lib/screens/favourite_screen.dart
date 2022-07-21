import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/widgets/favourite_screen_products.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Favourite Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            FavouriteScreenProducts(),
          ],
        ),
      ),
    );
  }
}
