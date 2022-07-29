import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/delivery%20detail/add_delivery_info.dart';
import 'package:my_food_ordering_app/screens/delivery%20detail/single_delivery_item.dart';
import 'package:my_food_ordering_app/screens/payment_summery/payment_summery.dart';

// ignore: must_be_immutable
class DeliveryInformationScreen extends StatelessWidget {
  double tprice;
  QuerySnapshot<Object?>? cartItem;
  DeliveryInformationScreen({
    Key? key,
    required this.tprice,
    required this.cartItem,
  }) : super(key: key);

  QuerySnapshot? current;

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("delivery-address")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("address-information")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          current = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? const Center(
                  child: Text("No Data Found! Please Add Delivery Address"),
                )
              : Column(
                  children: [
                    const ListTile(
                      title: Text("Deliver To"),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 545,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          // ignore: no_leading_underscores_for_local_identifiers
                          DocumentSnapshot _documentSnapshot =
                              snapshot.data!.docs[index];
                          return Column(
                            children: [
                              SingleDeliveryItem(
                                title: _documentSnapshot["First-Name"] +
                                    " " +
                                    _documentSnapshot["Last-Name"],
                                address: _documentSnapshot["Address"],
                                city: _documentSnapshot["City"],
                                state: _documentSnapshot["State"],
                                pinCode: _documentSnapshot["Pin-Code"],
                                mobileNo: _documentSnapshot["Mobile-No"],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (snapshot.data!.docs.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentSummeryScreen(
                                  current: current,
                                  tprice: tprice,
                                  cItems: cartItem,
                                ),
                              ),
                            );
                          }
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
                  ],
                );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20.0, bottom: 100.0),
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
    );
  }
}
