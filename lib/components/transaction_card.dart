import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String description;
  final String amount;
  final String time;

  const TransactionCard({
    Key? key,
    required this.description,
    required this.amount,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
