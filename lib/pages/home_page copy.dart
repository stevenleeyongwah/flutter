import 'package:coffee_card/components/add_money_btn.dart';
import 'package:coffee_card/components/scan_qr_btn.dart';
import 'package:coffee_card/components/send_money_btn.dart';
import 'package:coffee_card/models/payment_info.dart';
import 'package:coffee_card/pages/view_transaction_page.dart';
import 'package:coffee_card/services/payment_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _balance = "";

  @override
  void initState() {
    super.initState();
    _getPaymentInfo();
  }

  Future<void> _getPaymentInfo() async {
    try {
      final paymentService = PaymentService();
      final PaymentInfo response = await paymentService.getPaymentInfo();

      print("getPaymentInfo");

      setState(() {
        _balance = response.balance;
      });
    } catch (error) {
      print(error);
    } finally {
      // Any finalization code
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4A148C),
              Color(0xFF880E4F),
              Color.fromRGBO(136, 14, 79, 0.816),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text(
                  'Total balance',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 16, // Optional: Set font size if needed
                    fontWeight: FontWeight.normal, // Optional: Set font weight if needed
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _balance,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 20, // Optional: Set font size if needed
                    fontWeight: FontWeight.normal, // Optional: Set font weight if needed
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Balance info', style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 28),
                // Action buttons
                Container(
                  padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
                  decoration: BoxDecoration(
                    color: Colors.purple, // Set the background color
                    borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddMoneyBtn(),
                      ScanQrBtn(),
                      SendMoneyBtn()
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                // Your everyday account
                const Text('Your everyday account', style: TextStyle(fontSize: 12, color: Colors.white)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _buildAccountCard('Main account', 'RM36.62', 'View transactions', context)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildAccountCard('Savings Pockets', 'RM0.00', '', context)),
                  ],
                ),
                const SizedBox(height: 20),
                // Your insights
                const Text('Your insights', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInsightCard('You received', 'RM0.00', 'Since 1 Aug', Icons.monetization_on),
                    _buildInsightCard('You spent', 'RM0.00', 'Since 1 Aug', Icons.money_off),
                    _buildInsightCard('Interest', 'RM1.00', 'Since 1 Aug', Icons.savings),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard(String title, String balance, String actionText, BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // 1:1 aspect ratio for equal width and height
      child: GestureDetector(
        onTap: () {
          if (actionText.isNotEmpty) {
            // Navigate to the View Transactions page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewTransactionPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 8),
              Text(balance, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              if (actionText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(actionText, style: const TextStyle(color: Color.fromARGB(255, 101, 3, 118), fontSize: 12)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String amount, String period, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(amount, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(period, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}