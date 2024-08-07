import 'package:flutter/material.dart';

class AddMoneyInput extends StatefulWidget {
  @override
  _AddMoneyInputState createState() => _AddMoneyInputState();
}

class _AddMoneyInputState extends State<AddMoneyInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controller with a default value
    _controller.text = 'RM 0.00';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.black,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: (value) {
        // Handle changes if necessary
      },
    );
  }
}