import 'package:coffee_card/models/payment_banks.dart';
import 'package:coffee_card/pages/add_money_page.dart';
import 'package:coffee_card/services/payment_service.dart';
import 'package:flutter/material.dart';

class AddMoneyContinueBtn extends StatefulWidget {
  @override
  _AddMoneyContinueBtnState createState() => _AddMoneyContinueBtnState();
}

class _AddMoneyContinueBtnState extends State<AddMoneyContinueBtn> {
  bool loading = false;
  List<PaymentBank> _banks = [];

  @override
  void initState() {
    super.initState();
    _getPaymentBanks();
  }

  Future<void> _getPaymentBanks() async {
    try {
      final paymentService = PaymentService();
      final List<PaymentBank> banks = await paymentService.getBanks();

      setState(() {
        _banks = banks;  // Store the fetched banks in the state variable
      });

      // setState(() {
      //   _balance = response.balance;
      // });
    } catch (error) {
      print(error);
    } finally {
      // Any finalization code
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 101, 3, 118),
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          _showBottomSheet(context);
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height
      backgroundColor: const Color.fromARGB(255, 101, 3, 118), // Set 
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.98, // Set height to 98% of screen
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select a bank', // Updated text
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Set header text color to white
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
              ),
              // Add more items as needed
            ],
          ),
        );
      },
    );
  }
}