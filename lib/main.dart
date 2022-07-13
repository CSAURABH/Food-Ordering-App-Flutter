import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_food_ordering_app/screens/bottom_navigation_Screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const BottomNavigationScreen(),
    );
  }
}
