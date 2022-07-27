import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/delivery%20detail/add_delivery_info.dart';
import 'package:my_food_ordering_app/screens/delivery%20detail/single_delivery_item.dart';
import 'package:my_food_ordering_app/screens/payment_screen.dart';

// ignore: must_be_immutable
class DeliveryInformationScreen extends StatelessWidget {
  double tprice;
  DeliveryInformationScreen({
    Key? key,
    required this.tprice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Delivery Information",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("To Deliver"),
          ),
          const Divider(
            height: 1,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                title: "Saurabh Chachere",
                address: "Plot No. 112, Pragati Nagar, Ranala, Kamptee",
                city: "Nagpur",
                state: "Maharashtra",
                pinCode: "441001",
                mobileNo: "8446775784",
              )
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddDeliveryInformationScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
