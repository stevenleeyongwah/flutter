import 'package:coffee_card/pages/add_money_page.dart';
import 'package:flutter/material.dart';

class SendMoneyBtn extends StatefulWidget {
  @override
  _SendMoneyBtnState createState() => _SendMoneyBtnState();
}

class _SendMoneyBtnState extends State<SendMoneyBtn> {
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
            child: Icon(Icons.send, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Send Money', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}