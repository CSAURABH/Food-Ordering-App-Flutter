import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/screens/login_screen.dart';
import 'package:my_food_ordering_app/widgets/profile_items.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://media-exp1.licdn.com/dms/image/C5603AQEmnX59emy-Mg/profile-displayphoto-shrink_800_800/0/1606653814177?e=1663200000&v=beta&t=CA5swFJQqZC2aUQ-B55d9KWsEHW2VuIDeoGnJMmL_nw"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Saurabh Chachere",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ProfileItems(
                text: "Payments",
                icon: Icons.account_balance_wallet,
                bcolor: Colors.blue,
              ),
              const ProfileItems(
                text: "Profile Settings",
                icon: Icons.settings,
                bcolor: Colors.blue,
              ),
              const ProfileItems(
                text: "Order History",
                icon: Icons.book,
                bcolor: Color.fromARGB(189, 34, 112, 45),
              ),
              const ProfileItems(
                text: "Booking",
                icon: Icons.search,
                bcolor: Color.fromARGB(255, 216, 200, 51),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
