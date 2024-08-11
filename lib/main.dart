import 'package:coffee_card/pages/add_money_page.dart';
import 'package:coffee_card/pages/main_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/home', // Set the default route
//       routes: {
//         '/login': (context) => LoginPage(), // Define the login route
//         '/home': (context) => HomePage(), // Define another route
//         // Add more routes as needed
//       },
//     );
//   }
// }
