import 'package:coffee_card/services/payment_service.dart';
import 'package:flutter/material.dart';

class ViewTransactionPage extends StatefulWidget {
  @override
  _ViewTransactionPageState createState() => _ViewTransactionPageState();
}

class _ViewTransactionPageState extends State<ViewTransactionPage> {
  Map<String, dynamic> _transactions = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      final transactionService = PaymentService();
      final transactions = await transactionService.getTransactions();
      print("transactions: ${transactions}");
      setState(() {
        _transactions = transactions;
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Main account'),
            SizedBox(height: 4),
            Text("12", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.add, 'Add Money'),
                _buildActionButton(Icons.send, 'Send Money'),
                _buildActionButton(Icons.more_horiz, 'More'),
              ],
            ),
            SizedBox(height: 20),
            _buildInterestInfoCard(),
            SizedBox(height: 20),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 101, 3, 118),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildInterestInfoCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RM0.73', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Interest earned since account opened\nCurrent interest is 3.00% p.a.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _transactions.entries.map<Widget>((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              entry.key,
              style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: entry.value.map<Widget>((transaction) {
                return _buildTransactionCard(
                  transaction['description']!,
                  transaction['amount']!,
                  transaction['time']!,
                );
              }).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTransactionCard(String description, String amount, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description, style: TextStyle(color: Colors.white, fontSize: 16)),
              SizedBox(height: 8),
              Text(time, style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
          Text(amount, style: TextStyle(color: Colors.greenAccent, fontSize: 16)),
        ],
      ),
    );
  }
}
