import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background_intro.jpg",
            ),
            Positioned(
              top: 230,
              left: 50,
              right: 50,
              child: Image.asset(
                "assets/images/logo.png",
                height: 300,
                width: 300,
              ),
            ),
            const Positioned(
              top: 100,
              left: 50,
              right: 50,
              child: Text(
                "Food Plaza",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 50,
              right: 50,
              bottom: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange,
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
