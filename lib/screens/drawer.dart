import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/widgets/title.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: UserAccountsDrawerHeader(
              accountName: TitleWidget(
                  text: "Saurabh Chachere",
                  size: 20,
                  colors: black,
                  weight: FontWeight.bold),
              accountEmail: TitleWidget(
                text: "saurabhchachere@gmail.com",
                size: 10,
                colors: black,
                weight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
