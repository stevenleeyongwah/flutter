import 'package:flutter/material.dart';
import '../services/payment_service.dart'; // Import the user service
import 'dart:convert'; // Import this if not already

class AddMoneyPage extends StatefulWidget {
  @override
  _AddMoneyPageState createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  TextEditingController _amountController = TextEditingController();
  List<double> _topUpOptions = [];

  void _updateAmount(double value) {
    setState(() {
      _amountController.text = value.toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchTopUpOptions();
  }

  Future<void> _fetchTopUpOptions() async {
    try {
      print("_fetchTopUpOptions");
      final paymentService = PaymentService();
      final Map<String, dynamic> response = await paymentService.getTopUpOptions();
      print("response hihihi ${response}");

      // Extract the options list and update _topUpOptions
      List<dynamic> options = response['options'];

      setState(() {
        _topUpOptions = options.map<double>((e) => e.toDouble()).toList();
      });
    } catch (error) {
      print(error);
    } finally {
      // Any finalization code
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color to match the dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Image.asset(
          //     'assets/dulenow_logo.png', // Replace with your asset
          //     height: 40,
          //     width: 40,
          //   ),
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter amount',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            
            SizedBox(height: 20),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                prefixText: 'RM ',
                prefixStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                border: InputBorder.none,
              ),
            ),
            // Text(
            //   'RM ${_amount.toStringAsFixed(2)}',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 40,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            SizedBox(height: 10),

            Text(
              'Minimum transfer amount is RM10.00',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            SizedBox(height: 30),
            
            Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0, // Horizontal space between buttons
            runSpacing: 8.0, // Vertical space between rows
            children: [
              for (int i = 0; i < _topUpOptions.length; i += 3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int j = i; j < i + 3 && j < _topUpOptions.length; j++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: _buildAmountButton(_topUpOptions[j]),
                        ),
                      ),
                    if (i + 3 > _topUpOptions.length)
                      for (int k = 0; k < 3 - (_topUpOptions.length - i); k++)
                        Expanded(child: SizedBox()),
                  ],
                ),
            ],
          ),

            Spacer(), // Pushes the button to the bottom
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.purpleAccent,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  // Handle forward action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountButton(double amount) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        'RM${amount.toStringAsFixed(0)}',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: () {
        _updateAmount(amount); // Update the amount when the button is pressed
      },
    );
  }
}