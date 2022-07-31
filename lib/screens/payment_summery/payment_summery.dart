import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/confirmation_page.dart';
import 'package:my_food_ordering_app/screens/payment_summery/order_items.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: must_be_immutable
class PaymentSummeryScreen extends StatefulWidget {
  num tprice;
  QuerySnapshot<Object?>? current;
  QuerySnapshot<Object?>? cItems;
  PaymentSummeryScreen({
    Key? key,
    required this.tprice,
    required this.current,
    required this.cItems,
  }) : super(key: key);

  @override
  State<PaymentSummeryScreen> createState() => _PaymentSummeryScreenState();
}

String? fName;
String? lName;
String? address;
String? city;
String? state;
String? pinCode;
String? email;
String? mNumber;

class _PaymentSummeryScreenState extends State<PaymentSummeryScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    initializeRAzorPay();
  }

  void initializeRAzorPay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void launchRazorPay({amount}) {
    var options = {
      'key': 'rzp_test_vaCwf9jHxQAW8f',
      'amount': amount * 100, //in the smallest currency sub-unit.
      'name': 'Saurabh Chachere',
      'description': 'Zomato',
      'timeout': 300, // in seconds
      'prefill': {'contact': '123456782', 'email': 'chacheresaurabh@gmail.com'}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      // ignore: avoid_print
      print("Error : $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // ignore: avoid_print
    print("Payment Successful");
    // ignore: avoid_print
    print(
        "${response.orderId} \n ${response.paymentId} \n ${response.signature}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // ignore: avoid_print
    print("Payment Faild");
    // ignore: avoid_print
    print("${response.code} \n${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // ignore: avoid_print
    print("Payment Faild");
  }

  int myType = 1;
  @override
  Widget build(BuildContext context) {
    num total = widget.tprice + 10;

    for (var post in widget.current!.docs) {
      fName = post["First-Name"];
      lName = post["Last-Name"];
      address = post["Address"];
      city = post["City"];
      state = post["State"];
      pinCode = post["Pin-Code"];
      email = post["Email"];
      mNumber = post["Mobile-No"];
    }

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
                  ListTile(
                    title: Text(
                      "${fName!} ${lName!}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //  "Plot No. 112, Pragati Nagar, Ranala, Kamptee, Nagpur, Maharashtra - 441001",
                    subtitle:
                        Text("${address!}, ${city!}, ${state!}, - ${pinCode!}"),
                  ),
                  const Divider(
                    height: 25,
                    color: black,
                  ),
                  ExpansionTile(
                    title: Text("Order Item ${widget.cItems!.docs.length}"),
                    children: const [
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
                      "\$ ${widget.tprice}",
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
                      "\$ $total",
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
                    value: 1,
                    groupValue: myType,
                    onChanged: (value) {
                      setState(
                        () {
                          myType = value as int;
                        },
                      );
                    },
                    title: const Text("Cash On Delivery"),
                    secondary: const Icon(
                      Icons.home,
                      color: Colors.orange,
                    ),
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: myType,
                    onChanged: (value) {
                      setState(
                        () {
                          myType = value as int;
                        },
                      );
                    },
                    title: const Text("Online Payment"),
                    secondary: const Icon(
                      Icons.wallet,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: ListTile(
          title: const Text("Total Amount"),
          subtitle: Text(
            "\$ $total",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          trailing: SizedBox(
            width: 200,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                if (myType == 1) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationScreen(),
                    ),
                  );
                } else {
                  launchRazorPay(amount: total);
                }
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfirmationScreen(),
                  ),
                );
              },
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Place Order",
                style: TextStyle(
                  color: black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
