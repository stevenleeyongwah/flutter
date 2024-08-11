import 'package:coffee_card/pages/add_money_page.dart';
import 'package:flutter/material.dart';

class ScanQrBtn extends StatefulWidget {
  @override
  _ScanQrBtnState createState() => _ScanQrBtnState();
}

class _ScanQrBtnState extends State<ScanQrBtn> {
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
            child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
          ),
        ),
        const SizedBox(height: 8),
        const Text('Scan QR', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}