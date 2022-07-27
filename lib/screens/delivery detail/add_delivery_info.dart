import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:my_food_ordering_app/helpers/styles.dart';
import 'package:my_food_ordering_app/screens/payment_summery.dart';

// ignore: must_be_immutable
class AddDeliveryInformationScreen extends StatefulWidget {
  const AddDeliveryInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDeliveryInformationScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<AddDeliveryInformationScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController mobileNoController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();

    sendDeliveryInfo() async {
      // ignore: unrelated_type_equality_checks
      if (firstNameController.text == "" ||
          // ignore: unrelated_type_equality_checks
          lastNameController.text == "" ||
          // ignore: unrelated_type_equality_checks
          emailController.text == "" ||
          // ignore: unrelated_type_equality_checks
          mobileNoController.text == "" ||
          // ignore: unrelated_type_equality_checks
          addressController.text == "" ||
          // ignore: unrelated_type_equality_checks
          cityController.text == "" ||
          // ignore: unrelated_type_equality_checks
          stateController.text == "" ||
          // ignore: unrelated_type_equality_checks
          pincodeController.text == "") {
        Fluttertoast.showToast(
          msg: "Please fill all the fields!",
          gravity: ToastGravity.CENTER,
        );
      } else {
        CollectionReference customerInfo =
            FirebaseFirestore.instance.collection("customer-info");

        return customerInfo
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("information")
            .doc()
            .set({
          "First-Name": firstNameController.text,
          "Last-Name": lastNameController.text,
          "Email": emailController.text,
          "Mobile-No": mobileNoController.text,
          "Address": addressController.text,
          "City/District/Town": cityController.text,
          "State": cityController.text,
          "Pin-Code": pincodeController.text
        }).then(
          (value) => Navigator.pop(context),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Delivery Address",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CUSTOMER INFORMATION",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(
                      firstNameController, context, "First Name"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(lastNameController, context, "Last Name"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(emailController, context, "Email"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(
                      mobileNoController, context, "Mobile No."),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(addressController, context, "Address"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(
                      cityController, context, "City/District/Town"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(stateController, context, "State"),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildTextFormField(pincodeController, context, "Pin Code"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        sendDeliveryInfo();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Padding _buildTextFormField(
    TextEditingController controller, BuildContext context, String labelText) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              label: Text(
                labelText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
