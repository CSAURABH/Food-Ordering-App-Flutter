import 'package:flutter/material.dart';

import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/payment_summery/order_items.dart';

// ignore: must_be_immutable
class PaymentSummeryScreen extends StatefulWidget {
  double tprice;
  // String fName;
  // String lName;
  // String address;
  // String city;
  // String state;
  // String pinCode;
  PaymentSummeryScreen({
    Key? key,
    required this.tprice,
    // required this.fName,
    // required this.lName,
    // required this.address,
    // required this.city,
    // required this.state,
    // required this.pinCode,
  }) : super(key: key);

  @override
  State<PaymentSummeryScreen> createState() => _PaymentSummeryScreenState();
}

enum AddressType {
  // ignore: constant_identifier_names
  CashOnDelivery,
  // ignore: constant_identifier_names
  OnlinePayment,
}

class _PaymentSummeryScreenState extends State<PaymentSummeryScreen> {
  var myType = AddressType.CashOnDelivery;
  @override
  Widget build(BuildContext context) {
    double total = widget.tprice + 10.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment Summery",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ListTile(
                    title: Text("Saurabh Chachere"),
                    subtitle: Text(
                      "Plot No. 112, Pragati Nagar, Ranala, Kamptee, Nagpur, Maharashtra - 441001",
                    ),
                  ),
                  const Divider(
                    height: 25,
                    color: black,
                  ),
                  const ExpansionTile(
                    title: Text("Order Item 10"),
                    children: [
                      OrderedItems(),
                    ],
                  ),
                  const Divider(
                    height: 20,
                    color: black,
                  ),
                  ListTile(
                    leading: const Text(
                      "Subtotal",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$ ${widget.tprice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Text(
                      "Delivery Fee",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$ 10",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "\$ ${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 11,
                    color: black,
                  ),
                  const ListTile(
                    leading: Text(
                      "Payment Option",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  RadioListTile(
                    value: AddressType.CashOnDelivery,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: const Text("Cash On Delivery"),
                    secondary: const Icon(
                      Icons.home,
                      color: Colors.orange,
                    ),
                  ),
                  RadioListTile(
                    value: AddressType.OnlinePayment,
                    groupValue: myType,
                    onChanged: (AddressType? value) {
                      setState(() {
                        myType = value!;
                      });
                    },
                    title: const Text("Online Payment"),
                    secondary: const Icon(
                      Icons.home,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text("Total Amount"),
        subtitle: Text(
          "\$ ${total.toStringAsFixed(2)}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            color: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              "Place Order",
              style: TextStyle(
                color: black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
