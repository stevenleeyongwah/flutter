import 'package:coffee_card/pages/add_money_page.dart';
import 'package:flutter/material.dart';

class AddMoneyBtn extends StatefulWidget {
  @override
  _AddMoneyBtnState createState() => _AddMoneyBtnState();
}

class _AddMoneyBtnState extends State<AddMoneyBtn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddMoneyPage()),
            );
          },
          child: const CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromARGB(255, 101, 3, 118),
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Add Money', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}