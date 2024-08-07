import 'package:coffee_card/pages/view_transaction_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color to match the dark theme
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total balance'),
            SizedBox(height: 4),
            Text('RM36.62', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Balance info', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(Icons.add, 'Add Money', context),
                  _buildActionButton(Icons.qr_code_scanner, 'Scan QR', context),
                  _buildActionButton(Icons.send, 'Send Money', context),
                ],
              ),
              SizedBox(height: 20),
              // Your everyday account
              Text('Your everyday account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: _buildAccountCard('Main account', 'RM36.62', 'View transactions', context)),
                  SizedBox(width: 10),
                  Expanded(child: _buildAccountCard('Savings Pockets', 'RM0.00', '', context)),
                ],
              ),
              SizedBox(height: 20),
              // Your insights
              Text('Your insights', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
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
    );
  }

  Widget _buildActionButton(IconData icon, String label, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Add navigation logic here if needed
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.purpleAccent,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
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
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
              SizedBox(height: 8),
              Text(balance, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              if (actionText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(actionText, style: TextStyle(color: Colors.purpleAccent, fontSize: 12)),
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
        SizedBox(height: 4),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
        SizedBox(height: 4),
        Text(amount, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(period, style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}