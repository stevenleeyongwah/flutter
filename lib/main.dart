import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/login_page.dart'; // Import your login page
import 'pages/home_page.dart'; // Import other pages

Future<void> main() async {
  await dotenv.load(); // Load environment variables
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Set the default route
      routes: {
        '/login': (context) => LoginPage(), // Define the login route
        '/home': (context) => HomePage(), // Define another route
        // Add more routes as needed
      },
    );
  }
}
