import 'package:flutter/material.dart';

class PaymentSummeryScreen extends StatefulWidget {
  const PaymentSummeryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSummeryScreen> createState() => _PaymentSummeryScreenState();
}

class _PaymentSummeryScreenState extends State<PaymentSummeryScreen> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
